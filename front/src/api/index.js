import { formatDate } from "../utils/helpers";
import * as Realm from "realm-web";

const app = new Realm.App({ id: "application-0-konnn" });

const config = require("../config.json");

class API {
  BASE_URL;
  CFP_STATUS = {
    PENDING: "pending",
    SUBMITTED: "submitted",
    ACCEPTED: "accepted",
    REJECTED: "rejected",
    IGNORED: "ignored"
  }

  constructor(options) {
    this.BASE_URL = options.BASE_URL;
    this.tokens = {};
  }

  userLogin() {
    const redirectUri = "http://localhost:3000";
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

  getAccessToken() {
    // let tokens = localStorage.getItem("tokens");
    // tokens = JSON.parse(tokens);
    // return tokens.accessToken;
    console.log("ERR: Someone called getAccessToken()");
    return "token";
  }

  async get(url) {
    if (url.substr(0, 1) !== "/") url = `/${url}`;
    let data = await fetch(`${this.BASE_URL}${url}`, {
      headers: {
        "Authorization": `Bearer ${this.getAccessToken()}`
      }
    }).then(resp=>resp.json());
    return data;
  }

  async post(url, data) {
    if (!data) data = {};
    if (url.substr(0, 1) !== "/") url = `/${url}`;
    let response = await fetch(`${this.BASE_URL}${url}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${this.getAccessToken()}`
      },
      body: JSON.stringify(data)
    }).then(resp=>resp.json());
    return response;
  }

  async getCfp(id) {
    let data = await this.get(`/cfp/${id}`);
    return data;
  }

  async getCfps() {
    // let cfps = await this.get("/cfp");
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
    let data = { submissions, edit };
    let response = await this.post(`/cfp/submitted/${cfpId}`, data);
    return response;
  }

  async approvedTalks(cfpId, approvedTalks) {
    let data = { approved: approvedTalks };
    let response = await this.post(`/cfp/approved/${cfpId}`, data);
    return response;
  }

  async cfpRejected(cfpId) {
    let response = await this.post(`/cfp/rejected/${cfpId}`);
    return response;
  }

  async cfpIgnored(cfpId) {
    let response = await this.post(`/cfp/ignored/${cfpId}`);
    return response;
  }

  async getTalks() {
    let data = await this.get("/talk");
    return data;
  }

  async getSubmittedTalks(cfpId) {
    let data = await this.get(`/cfp/submitted/${cfpId}`);
    return data;
  }

  async getUpcomingEvents() {
    let data = await this.get(`/upcoming`);
    data = data.map(upcoming => {
      upcoming.dates = `${formatDate(upcoming.start_date)} - ${formatDate(upcoming.end_date)}`;
      return upcoming;
    });
    return data;
  }

  async postTalk(data) {
    let resp = await this.post("/talk", data);
    return resp;
  }

  async postProfileField(data) {
    let resp = await this.post("/profile/field", data);
    return resp;
  }

  async getProfile() {
    let resp = await this.get("/profile");
    return resp;
  }
}

const api = new API({
  BASE_URL: config.BASE_URL
});

export default api;