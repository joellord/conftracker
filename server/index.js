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

const start = async () => {
  publicKey= await getCertificate();

  let jwtCheck = jwt({secret: publicKey, algorithms: ['RS256']});
  
  app.get("/", (req, res) => {
    res.send("Hello").status(200);
  });
  
  app.get("/cfp", jwtCheck, async (req, res) => {
    let sql = (
      `SELECT c.*, COUNT(s.id) AS talks_submitted 
      FROM cfp c 
      LEFT JOIN cfp_submissions s 
      ON (s.cfp_id = c.id AND s.user_id = ?) 
      WHERE c.cfp_close_date >= NOW()
      GROUP BY c.id ORDER BY cfp_close_date`);
    let cfps = await query(sql, [req.user.sub]);
    console.log(cfps);
    res.send(cfps).status(200);
  });

  app.get("/cfp/:id", jwtCheck, async (req, res) => {
    let cfp = await query("SELECT * FROM cfp WHERE id = ?", req.params.id);
    res.send(cfp).status(200);
  });
  
  app.post("/cfp", jwtCheck, async (req, res) => {
    console.log(req.body);
    insert("cfp", req.body);
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

  app.get("/talk", jwtCheck, async (req, res) => {
    let talks = await query("SELECT * FROM talk WHERE created_by = ?", req.user.sub);
    res.send(talks).status(200);
  });
  
  app.post("/talk", jwtCheck, async (req, res) => {
    console.log(req.body);
    insert("talk", req.body);
    res.send({}).status(200);
  });

  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}

start();