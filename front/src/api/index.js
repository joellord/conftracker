import { formatDate } from "../utils/helpers";

const config = require("../config.json");
const keycloak = require("../keycloak");

class API {
  BASE_URL;
  CFP_STATUS = {
    PENDING: "pending",
    SUBMITTED: "submitted",
    ACCEPTED: "accepted",
    REJECTED: "rejected"
  }

  constructor(options) {
    this.BASE_URL = options.BASE_URL;
  }

  async get(url) {
    if (url.substr(0, 1) !== "/") url = `/${url}`;
    let data = await fetch(`${this.BASE_URL}${url}`, {
      headers: {
        "Authorization": `Bearer ${keycloak.default.token}`
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
        "Authorization": `Bearer ${keycloak.default.token}`
      },
      body: JSON.stringify(data)
    }).then(resp=>resp.json());
    return response;
  }

  async getCfp(id) {
    let data = await this.get(`/cfp/${id}`);
    return data[0];
  }

  async getCfps() {
    let cfps = await this.get("/cfp");
    let now = new Date();
    cfps = cfps.map(cfp => {
      cfp.dates = `${formatDate(cfp.start_date)} - ${formatDate(cfp.end_date)}`;
      let cfpClosingDate = new Date(cfp.cfp_close_date);
      cfp.cfp_close_date = formatDate(cfp.cfp_close_date);
      const soonInMs = 10 * 24 * 60 * 60 * 1000;
      if (cfpClosingDate.getTime() - now.getTime() < soonInMs) cfp.closingSoon = true;
      if (cfpClosingDate.getTime() < now.getTime()) cfp.cfpExpired = true;
      
      cfp.status = this.CFP_STATUS.PENDING;
      const submitted = cfp.talks_submitted;
      const accepted = (cfp.talks_accepted === null) ? 0 : cfp.talks_accepted;
      const rejected = (cfp.talks_rejected === null) ? 0 : cfp.talks_rejected
      if (submitted > 0 && accepted === 0 && rejected === 0) {
        cfp.status = this.CFP_STATUS.SUBMITTED;
      }
      if (submitted > 0 && accepted + rejected === submitted && accepted > 0) {
        cfp.status = this.CFP_STATUS.ACCEPTED;
      }
      if (submitted > 0 && rejected === submitted) {
        cfp.status = this.CFP_STATUS.REJECTED;
      }
      return cfp;
    });
    return cfps;
  }

  async postCfp(data) {
    let response = await this.post("/cfp", data);
    return response;
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

  async getTalks() {
    let data = await this.get("/talk");
    return data;
  }

  async getSubmittedTalks(cfpId) {
    let data = await this.get(`/cfp/submitted/${cfpId}`);
    return data;
  }

  async postTalk(data) {
    let resp = await this.post("/talk", data);
    return resp;
  }
}

const api = new API({
  BASE_URL: config.BASE_URL
});

export default api;