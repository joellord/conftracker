import { formatDate } from "../utils/helpers";
import * as Realm from "realm-web";

const app = new Realm.App({ id: "application-0-konnn" });
const ObjectId = Realm.BSON.ObjectId;

const config = require("../config.json");

class API {
  CFP_STATUS = {
    PENDING: "pending",
    SUBMITTED: "submitted",
    ACCEPTED: "accepted",
    REJECTED: "rejected",
    IGNORED: "ignored"
  }

  userLogin() {
    const redirectUri = config.REDIRECT_URL;
    const credentials = Realm.Credentials.google(redirectUri, {openId: true});

    app.logIn(credentials).then(user => {
      console.log(`Logged in with id: ${user.id}`);
    });
    Realm.handleAuthRedirect();
  }

  userIsLoggedIn() {
    const user = this.getUserProfile();
    return user && user.isLoggedIn;
  }

  getUserProfile() {
    const user = app.currentUser;
    return user;
  }

  getUserId() {
    return app.currentUser.id;
  }

  userLogout() {
    app.currentUser.logOut();
  }

  getCollection(collectionName) {
    let user = this.getUserProfile();
    let mongodb = user.mongoClient("mongodb-atlas");
    let collection = mongodb.db(config.DB_NAME).collection(collectionName);
    return collection;
  }

  async getCfp(id) {
    let cfpCollection = this.getCollection("cfps");
    let cfp = await cfpCollection.aggregate([{
      $match: {_id: ObjectId(id)}
    }, {
      '$addFields': {
        'mySubmissions': {
          '$filter': {
            'input': '$submissions', 
            'as': 'submission', 
            'cond': {
              '$eq': [
                '$$submission.user_id', this.getUserId()
              ]
            }
          }
        }
      }
    }]);
    return cfp[0];
  }

  async getCfps() {
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
                  '$$submission.user_id', this.getUserId()
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
    let cfpCollection = this.getCollection("cfps");
    let cfps = await cfpCollection.aggregate(pipeline);

    let now = new Date();
    let yesterday = new Date(); yesterday.setDate(yesterday.getDate() - 1);
    cfps = cfps.map(cfp => {
      cfp.dates = `${formatDate(cfp.start_date)} - ${formatDate(cfp.end_date)}`;
      let cfpClosingDate = new Date(cfp.cfp_close_date);
      
      //Ignore expired CFPs with no submissions
      if (cfpClosingDate.getTime() < yesterday.getTime() && !cfp.talks_submitted) {
        cfp.cfp_ignored = true;
      }

      cfp.cfp_close_date = formatDate(cfp.cfp_close_date);
      const soonInMs = 10 * 24 * 60 * 60 * 1000;
      if (cfpClosingDate.getTime() - now.getTime() < soonInMs) cfp.closingSoon = true;
      if (cfpClosingDate.getTime() <= yesterday.getTime()) cfp.cfpExpired = true;
      
      cfp.status = this.CFP_STATUS.PENDING;
      const submitted = cfp.talks_submitted;
      const accepted = (!cfp.talks_accepted) ? 0 : cfp.talks_accepted;
      const rejected = (!cfp.talks_rejected) ? 0 : cfp.talks_rejected;
      if (submitted > 0 && accepted === 0 && rejected === 0) {
        cfp.status = this.CFP_STATUS.SUBMITTED;
      }
      if (submitted > 0 && accepted + rejected === submitted && accepted > 0) {
        cfp.status = this.CFP_STATUS.ACCEPTED;
      }
      if (submitted > 0 && rejected === submitted) {
        cfp.status = this.CFP_STATUS.REJECTED;
      }
      if (cfp.cfp_ignored) cfp.status = this.CFP_STATUS.IGNORED;
      return cfp;
    });
    return cfps;
  }

  async postCfp(data) {
    data.created_by = this.getUserId();

    // Convert dates
    data.start_date = new Date(data.start_date);
    data.end_date = new Date(data.end_date);
    data.cfp_close_date = new Date(data.cfp_close_date);

    // Add required fields
    data.submissions = [];

    let cfpCollection = this.getCollection("cfps");
    let result = await cfpCollection.insertOne(data);
    return result;
  }

  async submitTalks(cfpId, submissions, edit) {
    let profileCollection = this.getCollection("profile");
    let cfpCollection = this.getCollection("cfps");
    let profile = await profileCollection.findOne({user_id: this.getUserId()});
    let talks = profile.talks;
    let submittedTalks = submissions.map(index => {
      let talk = talks[index];
      talk.status = "submitted";
      talk.user_id = this.getUserId();
      return talk;
    });

    let filter = {
      '_id': ObjectId(cfpId)
    };

    if (edit) {
      let pullUpdate = { "$pull": { "submissions": {"user_id": this.getUserId() } } };
      await cfpCollection.updateOne(filter, pullUpdate);
    }

    let update =  { "$push": { "submissions": { "$each": submittedTalks } } };
    let result = await cfpCollection.updateOne(filter, update);
    return result;
  }

  async approvedTalks(cfpId, approvedTalks) {
    let data = { approved: approvedTalks };
    let cfpCollection = this.getCollection("cfps");
    let filter = {
      _id: ObjectId(cfpId), 
      "submissions.user_id": this.getUserId()
    };
    let update = {"$set": {"submissions.$[element].status": "accepted"}};

    data.approved.map(async talk => {
      let arrayFilters = [{"element.title": talk}];
      await cfpCollection.updateOne(filter, update, {arrayFilters});
    });

    // Set all other talks as rejected
    update = {"$set": {"submissions.$[element].status": "rejected"}};
    let arrayFilters = [{"element.status": "submitted"}]
    await cfpCollection.updateOne(filter, update, {arrayFilters});
    return {};
  }

  async cfpRejected(cfpId) {
    let cfpCollection = this.getCollection("cfps");
    let filter = { _id: ObjectId(cfpId), "submissions.user_id": this.getUserId() };
    let pipeline = [{
      $set: {
        "submissions.status": "rejected"
      }
    }];
    let result = await cfpCollection.updateOne(filter, pipeline);
    return result;
  }

  async cfpIgnored(cfpId) {
    let cfpCollection = this.getCollection("cfps");
    let filter = {
      _id: ObjectId(cfpId)
    };
    let update = {"$set": {"cfp_ignored": true}};
    let result = await cfpCollection.updateOne(filter, update);
    return result;
  }

  async getTalks() {
    let profileCollection = this.getCollection("profile");
    let profile = await profileCollection.findOne({
      user_id: this.getUserId()
    });
    return profile.talks;
  }

  async getSubmittedTalks(cfpId) {
    let cfpCollection = this.getCollection("cfps");
    let pipeline = [{$match: {
      _id: ObjectId(cfpId),
     }}, {$unwind: {
      path: '$submissions',
      includeArrayIndex: 'submissions.arrayIndex'
     }}, {$match: {
      'submissions.user_id': this.getUserId()
     }}, {$addFields: {
      title: '$submissions.title',
      status: '$submissions.status',
      user_id: '$submissions.user_id',
      arrayIndex: '$submissions.arrayIndex'
     }}, {$project: {
      title: 1,
      status: 1,
      user_id: 1,
      arrayIndex: 1
     }}];
     let data = await cfpCollection.aggregate(pipeline);
     return data;
  }

  async getUpcomingEvents() {
    let cfpCollection = this.getCollection("cfps");
    let pipeline = [
      {
        '$match': {
          'end_date': {
            '$gt': new Date()
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
                  '$$submission.user_id', this.getUserId()
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
    let data = await cfpCollection.aggregate(pipeline);

    data = data.map(upcoming => {
      upcoming.dates = `${formatDate(upcoming.start_date)} - ${formatDate(upcoming.end_date)}`;
      return upcoming;
    });
    return data;
  }

  async postTalk(data) {
    let profileCollection = this.getCollection("profile");
    let result = await profileCollection.updateOne(
      {user_id: this.getUserId()},
      {
        $push: {
          talks: data
        }
      }
    );
    return result;
  }

  async postProfileField(data) {
    let profileCollection = this.getCollection("profile");
    let filter = { _id: this.getUserId() };
    let update = { "$push": {"profileFields": data}};
    let result = profileCollection.updateOne(filter, update);
    return result;
  }

  async getProfile() {
    let profileCollection = this.getCollection("profile");
    let profile = await profileCollection.findOne({
      user_id: this.getUserId()
    });
    return profile;
  }
}

const api = new API();

export default api;