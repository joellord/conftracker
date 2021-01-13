const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");
const jwt = require("express-jwt");
const fetch = require("node-fetch");

const app = express();

app.use(cors());
app.use(bodyParser.json());

const PORT = process.env.PORT;

const getCertificate = async () => {
  const KEYCLOAK_URL = "http://keycloak:8080";
  const REALM = "myrealm";
  const openIdConfigUrl = `${KEYCLOAK_URL}/auth/realms/${REALM}/.well-known/openid-configuration`;
  let config = await fetch(openIdConfigUrl).then(resp => resp.json());
  let jwksUri = config.jwks_uri;
  let certData = await fetch(jwksUri).then(resp => resp.json()).then(certData => {
    certData = certData.keys[0];
    let cert = `-----BEGIN CERTIFICATE-----\n${certData.x5c[0]}\n-----END CERTIFICATE-----`;
    return cert;
  });
  return certData;
}

let publicKey;

const query = (sql, params = []) => {
  const connection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    port: 3306
  });
  let p = new Promise((resolve, reject) => {
    connection.query(sql, params, (err, results) => {
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

const start = async () => {
  publicKey= await getCertificate();

  let jwtCheck = jwt({secret: publicKey, algorithms: ['RS256']});
  
  app.get("/", (req, res) => {
    res.send("Hello").status(200);
  });
  
  app.get("/cfp", jwtCheck, async (req, res) => {
    let sql = (
      `SELECT c.*,
        COUNT(s.id) AS talks_submitted,
        SUM(s.accepted = 1) AS talks_accepted,
        SUM(s.accepted = 0) AS talks_rejected
      FROM cfp c 
      LEFT JOIN cfp_submissions s 
      ON (s.cfp_id = c.id AND s.user_id = ?) 
      WHERE c.cfp_close_date >= NOW()
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
    console.log(data);
    insert("cfp", data);
    res.send({}).status(200);
  });

  app.post("/cfp/submitted/:cfpId", jwtCheck, (req, res) => {
    console.log(`Submitted ${req.body.submissions} to cfp ${req.params.cfpId} by user ${req.user.sub}`);
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
    console.log(`Talks approved for cfp ${req.params.cfpId}: ${req.body.approved} for user ${req.user.sub}`);
    let submissions = await query("SELECT * FROM cfp_submissions WHERE cfp_id = ? AND user_id = ?", [req.params.cfpId, req.user.sub]);
    submissions.map(async submission => {
      await update(
        "cfp_submissions", 
        {accepted: (req.body.approved.indexOf(submission.talk_id) > -1)}, 
        {id: submission.id}
      );
    });
    res.send({}).status(200);
  });

  app.post("/cfp/rejected/:cfpId", jwtCheck, async (req, res) => {
    console.log(`All talks rejected for cfp ${req.params.cfpId}`);
    await update("cfp_submissions", {accepted: false}, {user_id: req.user.sub, cfp_id: req.params.cfpId});
    res.send({}).status(200);
  });

  app.get("/cfp/submitted/:cfpId", jwtCheck, async (req, res) => {
    let talks = await query("SELECT t.* FROM talk t, cfp_submissions s WHERE s.cfp_id = ? GROUP BY t.id", req.params.cfpId);
    res.send(talks).status(200);
  });

  app.get("/talk", jwtCheck, async (req, res) => {
    let talks = await query("SELECT * FROM talk WHERE created_by = ?", req.user.sub);
    res.send(talks).status(200);
  });
  
  app.post("/talk", jwtCheck, async (req, res) => {
    let data = req.body;
    data.created_by = req.user.sub;
    console.log(data);
    insert("talk", data);
    res.send({}).status(200);
  });

  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}

start();