const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");
const jwt = require("express-jwt");
const jwks = require("jwks-rsa");
const fetch = require("node-fetch");

const Logger = require("./utils/Logger");

let logger = new Logger();

const app = express();

app.use(cors());
app.use(bodyParser.json());

const PORT = process.env.PORT;

const dbConfig = {
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: 3306
};
const pool = mysql.createPool(dbConfig);

const AUTH0_DOMAIN = "conf-tracker.auth0.com";
const AUTH0_AUDIENCE = "https://conftracker.com";
const jwtCheck = jwt({
  // Dynamically provide a signing key based on the kid in the header and the signing keys provided by the JWKS endpoint
  secret: jwks.expressJwtSecret({
    cache: true,
    rateLimit: true,
    jwksRequestsPerMinute: 5,
    jwksUri: `https://${AUTH0_DOMAIN}/.well-known/jwks.json`
  }),

  // Validate the audience and the issuer
  audience: AUTH0_AUDIENCE, //replace with your API's audience, available at Dashboard > APIs
  issuer: `https://${AUTH0_DOMAIN}/`,
  algorithms: [ 'RS256' ]
});

const query = (sql, params = []) => {
  // const connection = mysql.createConnection(dbConfig);
  let p = new Promise((resolve, reject) => {
    pool.query(sql, params, (err, results) => {
      if (err) reject(err);
      resolve(results);
    });
  });
  return p;
};

const insert = (table, values) => {
  let fields = Object.keys(values).join(",");
  let filler = "?".repeat(Object.keys(values).length).split("").join(",");
  let sql = `INSERT INTO ${table} (${fields}) VALUES(${filler})`;
  return query(sql, Object.values(values));
}

const update = async (table, values, where) => {
  let params = [];
  let updateSql = "";
  Object.keys(values).map(field => {
    updateSql += `${field}=?, `;
    params.push(values[field]);
  });
  updateSql = updateSql.substr(0, updateSql.lastIndexOf(", "));
  let whereSql = "";
  Object.keys(where).map(whereKey => {
    whereSql += `${whereKey}=? AND `;
    params.push(where[whereKey]);
  });
  whereSql = whereSql.substr(0, whereSql.lastIndexOf(" AND "));
  let sql = `UPDATE ${table} SET ${updateSql} WHERE ${whereSql}`;
  let resp = await query(sql, params);
  return resp;
}

const remove = async (table, where) => {
  let params = [];
  let whereSql = "";
  Object.keys(where).map(whereKey => {
    whereSql += `${whereKey}=? AND `;
    params.push(where[whereKey]);
  });
  whereSql = whereSql.substr(0, whereSql.lastIndexOf(" AND "));
  let sql = `DELETE FROM ${table} WHERE ${whereSql}`;
  let resp = await query(sql, params);
  return resp;
}

const start = async () => {
  app.get("/", (req, res) => {
    res.send("Hello").status(200);
  });
  
  app.get("/cfp", jwtCheck, async (req, res) => {
    let sql = (
      `SELECT c.*,
        COUNT(s.id) AS talks_submitted,
        SUM(s.accepted = 1) AS talks_accepted,
        SUM(s.accepted = 0) AS talks_rejected,
        COUNT(i.id) AS cfp_ignored
      FROM cfp c 
      LEFT JOIN cfp_submissions s 
      ON (s.cfp_id = c.id AND s.user_id = ?) 
      LEFT JOIN cfp_ignored i
      ON (i.cfp_id = c.id)
      WHERE c.end_date >= CURDATE()
      GROUP BY c.id ORDER BY cfp_close_date`);
    let cfps = await query(sql, [req.user.sub]);
    res.send(cfps).status(200);
  });

  app.get("/cfp/:id", jwtCheck, async (req, res) => {
    let cfp = await query("SELECT * FROM cfp WHERE id = ?", req.params.id);
    res.send(cfp).status(200);
  });
  
  app.post("/cfp", jwtCheck, async (req, res) => {
    let data = req.body;
    data.created_by = req.user.sub;
    logger.info("Added new CFP");
    logger.log(data);
    insert("cfp", data);
    res.send({}).status(200);
  });

  app.post("/cfp/submitted/:cfpId", jwtCheck, async (req, res) => {
    if (req.body.edit) {
      logger.log(`This is an edit, start by removing previous entries`);
      await remove("cfp_submissions", {
        cfp_id: req.params.cfpId,
        user_id: req.user.sub
      });
    }
    logger.info(`Submitted ${req.body.submissions} to cfp ${req.params.cfpId} by user ${req.user.sub}`);
    req.body.submissions.map(async submission => {
      await insert("cfp_submissions", {
        cfp_id: req.params.cfpId,
        talk_id: submission,
        user_id: req.user.sub
      });
    });
    res.send({}).status(200);
  });

  app.post("/cfp/approved/:cfpId", jwtCheck, async (req, res) => {
    logger.info(`Talks approved for cfp ${req.params.cfpId}: ${req.body.approved} for user ${req.user.sub}`);
    let submissions = await query("SELECT * FROM cfp_submissions WHERE cfp_id = ? AND user_id = ?", [req.params.cfpId, req.user.sub]);
    submissions.map(async submission => {
      await update(
        "cfp_submissions", 
        {accepted: (req.body.approved.indexOf(submission.talk_id) > -1 ? 1 : 0)}, 
        {id: submission.id}
      );
    });
    res.send({}).status(200);
  });

  app.post("/cfp/rejected/:cfpId", jwtCheck, async (req, res) => {
    logger.info(`All talks rejected for cfp ${req.params.cfpId}`);
    await update("cfp_submissions", {accepted: false}, {user_id: req.user.sub, cfp_id: req.params.cfpId});
    res.send({}).status(200);
  });

  app.post("/cfp/ignored/:cfpId", jwtCheck, async (req, res) => {
    logger.info(`Ignoring cfp ${req.params.cfpId} for user ${req.user.sub}`);
    await insert("cfp_ignored", {cfp_id: req.params.cfpId, user_id: req.user.sub});
    res.send({}).status(200);
  });

  app.get("/cfp/submitted/:cfpId", jwtCheck, async (req, res) => {
    let talks = await query("SELECT t.* FROM talk t, cfp_submissions s WHERE s.talk_id = t.id AND s.cfp_id = ? GROUP BY t.id", req.params.cfpId);
    res.send(talks).status(200);
  });

  app.get("/upcoming", jwtCheck, async (req, res) => {
    let upcoming = await query(`
      SELECT c.conference, s.cfp_id, s.user_id, c.start_date, c.end_date, c.url, 
        (SELECT GROUP_CONCAT(t.title) FROM cfp_submissions b, talk t WHERE b.cfp_id = s.cfp_id AND t.id = b.talk_id AND b.accepted = 1) AS talks 
      FROM cfp_submissions s, cfp c 
      WHERE s.accepted = 1 
        AND c.id = s.cfp_id 
        AND c.end_date > NOW()
      GROUP BY cfp_id, user_id, start_date, end_date, url
      ORDER BY c.start_date
    `);
    res.send(upcoming).status(200);
  });

  app.get("/talk", jwtCheck, async (req, res) => {
    logger.info("Requested list of talks");
    let talks = await query("SELECT * FROM talk WHERE created_by = ?", req.user.sub);
    res.send(talks).status(200);
  });
  
  app.post("/talk", jwtCheck, async (req, res) => {
    let data = req.body;
    data.created_by = req.user.sub;
    logger.info("Added new talk");
    logger.log(data);
    insert("talk", data);
    res.send({}).status(200);
  });

  app.post("/profile/field", jwtCheck, async (req, res) => {
    let data = req.body;
    data.user_id = req.user.sub;
    logger.info(`Adding new profile field ${data.label}: ${data.value}`);
    insert("profile", data);
    res.send({}).status(200);
  });

  app.get("/profile", jwtCheck, async (req, res) => {
    const userId = req.user.sub;
    logger.info(`Profile data requested for user ${userId}`);
    let profile = await query("SELECT * FROM profile WHERE user_id = ?", userId);
    res.send(profile).status(200);
  });

  app.listen(PORT, () => {
    logger.log(`Server running on port ${PORT}`);
  });
}

start();