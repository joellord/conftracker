const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");
const jwt = require("express-jwt");
const jwks = require("jwks-rsa");
const fetch = require("node-fetch");
const { MongoClient, ObjectId } = require("mongodb");

const Logger = require("./utils/Logger");

let logger = new Logger();

const app = express();

app.use(cors());
app.use(bodyParser.json());

const PORT = process.env.PORT || 3003;
const MONGO_URL = "mongodb+srv://conftracker:Conftracker@cluster0.mydmq.mongodb.net/conference";
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
  const client = new MongoClient(MONGO_URL);

  await client.connect().catch(e => {
    console.error("Error connecting to database");
    console.error(e);
    process.exit();
  });
  const db = client.db("conferences");
  const cfpCollection = db.collection("cfps");
  const talksCollection = db.collection("talks");
  const profileCollection = db.collection("profile");

  app.get("/", (req, res) => {
    res.send("Hello").status(200);
  });
  
  app.get("/cfp", jwtCheck, async (req, res) => {
    let pipeline = [
      {
        '$match': {
          'end_date': {'$gt': new Date()}
        }
      },
      {
        '$sort': { 'start_date': 1 }
      },
      {
        '$addFields': {
          'mySubmissions': {
            '$filter': {
              'input': '$submissions', 
              'as': 'submission', 
              'cond': {
                '$eq': [
                  '$$submission.user_id', req.user.sub
                ]
              }
            }
          }
        }
      }, {
        '$addFields': {
          'talks_accepted': {
            '$size': {
              '$filter': {
                'input': '$mySubmissions', 
                'as': 'submission', 
                'cond': {
                  '$eq': [
                    '$$submission.status', 'accepted'
                  ]
                }
              }
            }
          },
          'talks_submitted': {
            '$size': "$mySubmissions"
          },
          'talks_rejected': {
            '$size': {
              '$filter': {
                'input': '$mySubmissions', 
                'as': 'submission', 
                'cond': {
                  '$eq': [
                    '$$submission.status', 'rejected'
                  ]
                }
              }
            }
          }
        }
      }
    ];
    let cfps = await cfpCollection.aggregate(pipeline).toArray();
    // let sql = (
    //   `SELECT c.*,
    //     COUNT(s.id) AS talks_submitted,
    //     SUM(s.accepted = 1) AS talks_accepted,
    //     SUM(s.accepted = 0) AS talks_rejected,
    //     COUNT(i.id) AS cfp_ignored
    //   FROM cfp c 
    //   LEFT JOIN cfp_submissions s 
    //   ON (s.cfp_id = c.id AND s.user_id = ?) 
    //   LEFT JOIN cfp_ignored i
    //   ON (i.cfp_id = c.id)
    //   WHERE c.end_date >= CURDATE()
    //   GROUP BY c.id ORDER BY cfp_close_date`);
    // let cfps = await query(sql, [req.user.sub]);
    res.send(cfps).status(200);
  });

  app.get("/cfp/:id", jwtCheck, async (req, res) => {
    // let cfp = await query("SELECT * FROM cfp WHERE id = ?", req.params.id);
    let cfp = await cfpCollection.aggregate([{
      $match: {_id: ObjectId(req.params.id)}
    }, {
      '$addFields': {
        'mySubmissions': {
          '$filter': {
            'input': '$submissions', 
            'as': 'submission', 
            'cond': {
              '$eq': [
                '$$submission.user_id', req.user.sub
              ]
            }
          }
        }
      }
    }]).toArray();
    logger.info(cfp);
    res.send(cfp[0]).status(200);
  });
  
  app.post("/cfp", jwtCheck, async (req, res) => {
    let data = req.body;
    data.created_by = req.user.sub;
    logger.info("Added new CFP");
    logger.log(data);

    // Convert dates
    data.start_date = new Date(data.start_date);
    data.end_date = new Date(data.end_date);
    data.cfp_close_date = new Date(data.cfp_close_date);

    // Add required fields
    data.submissions = [];

    // insert("cfp", data);
    let result = await cfpCollection.insertOne(data);
    res.send(result).status(200);
  });

  app.post("/cfp/submitted/:cfpId", jwtCheck, async (req, res) => {
    // let cfp = 
    // if (req.body.edit) {
    //   logger.log(`This is an edit, start by removing previous entries`);
    //   await remove("cfp_submissions", {
    //     cfp_id: req.params.cfpId,
    //     user_id: req.user.sub
    //   });
    // }
    logger.info(`Submitted ${req.body.submissions} to cfp ${req.params.cfpId} by user ${req.user.sub}`);
    // Get the talk information 
    let profile = await profileCollection.findOne({user_id: req.user.sub});
    let talks = profile.talks;
    let submittedTalks = req.body.submissions.map(index => {
      let talk = talks[index];
      talk.status = "submitted";
      talk.user_id = req.user.sub;
      return talk;
    });

    let filter = {
      // '$match': {
        '_id': ObjectId(req.params.cfpId)
      // }
    };
    let pipeline = [
      {
        '$addFields': {
          'notMine': {
            '$filter': {
              'input': '$submissions', 
              'as': 'submission', 
              'cond': {
                '$ne': [
                  '$$submission.user_id', req.user.sub
                ]
              }
            }
          }
        }
      }, {
        '$set': {
          'submissions': {
            '$concatArrays': [
              '$notMine', submittedTalks
            ]
          },
        }
      },{
        '$unset': "notMine"
      }
    ];

    let result = await cfpCollection.updateOne(filter, pipeline);
    logger.info(result);
    res.send(result).status(200);
  });

  app.post("/cfp/approved/:cfpId", jwtCheck, async (req, res) => {
    logger.info(`Talks approved for cfp ${req.params.cfpId}: ${req.body.approved} for user ${req.user.sub}`);
    // let submissions = await query("SELECT * FROM cfp_submissions WHERE cfp_id = ? AND user_id = ?", [req.params.cfpId, req.user.sub]);
    // submissions.map(async submission => {
    //   await update(
    //     "cfp_submissions", 
    //     {accepted: (req.body.approved.indexOf(submission.talk_id) > -1 ? 1 : 0)}, 
    //     {id: submission.id}
    //   );
    // });
    let filter = {
      _id: ObjectId(req.params.cfpId), 
      "submissions.user_id": req.user.sub
    };
    let update = {"$set": {"submissions.$[element].status": "accepted"}};

    req.body.approved.map(async talk => {
      let arrayFilters = [{"element.title": talk}];
      let result = await cfpCollection.updateOne(filter, update, {arrayFilters});
    });

    // Set all other talks as rejected
    filter = {
      _id: ObjectId(req.params.cfpId), 
      "submissions.user_id": req.user.sub
    };
    update = {"$set": {"submissions.$[element].status": "rejected"}};
    arrayFilters = [{"element.status": "submitted"}]
    await cfpCollection.updateOne(filter, update, {arrayFilters});

    res.send({}).status(200);
  });

  app.post("/cfp/rejected/:cfpId", jwtCheck, async (req, res) => {
    logger.info(`All talks rejected for cfp ${req.params.cfpId}`);
    let filter = { _id: ObjectId(req.params.cfpId), "submissions.user_id": req.user.sub };
    let pipeline = [{
      $set: {
        "submissions.status": "rejected"
      }
    }];
    let result = await cfpCollection.updateOne(filter, pipeline);
    // await update("cfp_submissions", {accepted: false}, {user_id: req.user.sub, cfp_id: req.params.cfpId});
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
    // let upcoming = await query(`
    //   SELECT c.conference, s.cfp_id, s.user_id, c.start_date, c.end_date, c.url, 
    //     (SELECT GROUP_CONCAT(t.title) FROM cfp_submissions b, talk t WHERE b.cfp_id = s.cfp_id AND t.id = b.talk_id AND b.accepted = 1) AS talks 
    //   FROM cfp_submissions s, cfp c 
    //   WHERE s.accepted = 1 
    //     AND c.id = s.cfp_id 
    //     AND c.end_date > NOW()
    //   GROUP BY cfp_id, user_id, start_date, end_date, url
    //   ORDER BY c.start_date
    // `);
    let pipeline = [
      {
        '$match': {
          'end_date': {
            '$gt': new Date('Tue, 07 Dec 2021 12:29:41 GMT')
          }
        }
      }, {
        '$addFields': {
          'mySubmissions': {
            '$filter': {
              'input': '$submissions', 
              'as': 'submission', 
              'cond': {
                '$eq': [
                  '$$submission.user_id', 'google-oauth2|102260477336632272051'
                ]
              }
            }
          }
        }
      }, {
        '$match': {
          'mySubmissions.status': 'accepted'
        }
      }, {
        '$addFields': {
          'talks_accepted': {
            '$filter': {
              'input': '$mySubmissions', 
              'as': 'submission', 
              'cond': {
                '$eq': [
                  '$$submission.status', 'accepted'
                ]
              }
            }
          }
        }
      }, {
        '$addFields': {
          'talk_titles': {
            '$map': {
              'input': '$talks_accepted', 
              'as': 's', 
              'in': '$$s.title'
            }
          }
        }
      }, {
        '$addFields': {
          'talks': {
            '$reduce': {
              'input': '$talk_titles', 
              'initialValue': '', 
              'in': {
                '$cond': {
                  'if': {
                    '$eq': [
                      {
                        '$indexOfArray': [
                          '$talk_titles', '$$this'
                        ]
                      }, 0
                    ]
                  }, 
                  'then': {
                    '$concat': [
                      '$$value', '$$this'
                    ]
                  }, 
                  'else': {
                    '$concat': [
                      '$$value', ', ', '$$this'
                    ]
                  }
                }
              }
            }
          }
        }
      }, {
        '$sort': {
          'start_date': 1
        }
      }, {
        '$project': {
          '_id': 1, 
          'conference': 1, 
          'start_date': 1, 
          'end_date': 1, 
          'url': 1, 
          'talks': 1
        }
      }
    ];
    let upcoming = await cfpCollection.aggregate(pipeline).toArray();
    res.send(upcoming).status(200);
  });

  app.get("/talk", jwtCheck, async (req, res) => {
    logger.info("Requested list of talks");
    let profile = await profileCollection.findOne({
      user_id: req.user.sub
    });
    // let talks = await query("SELECT * FROM talk WHERE created_by = ?", req.user.sub);
    res.send(profile.talks).status(200);
  });
  
  app.post("/talk", jwtCheck, async (req, res) => {
    let data = req.body;
    logger.info("Added new talk");
    logger.log(data);
    let result = await profileCollection.updateOne(
      {user_id: req.user.sub},
      {
        $push: {
          talks: data
        }
      }
    );
    // insert("talk", data);
    res.send(result).status(200);
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
    let profile = await profileCollection.findOne({user_id: userId});
    // let profile = await query("SELECT * FROM profile WHERE user_id = ?", userId);
    res.send(profile).status(200);
  });

  app.listen(PORT, () => {
    logger.log(`Server running on port ${PORT}`);
  });
}

start();