const config = require("../config.json");
const keycloak = require("../keycloak");

class API {
  BASE_URL;

  constructor(options) {
    this.BASE_URL = options.BASE_URL;
  }

  async getCfps() {
    let data = await fetch(`${this.BASE_URL}/cfp`, {
      headers: {
        "Authorization": `Bearer ${keycloak.default.token}`
      }
    }).then(resp=>resp.json());
    return data;
  }

  async postCfp(data) {
    data.created_by = keycloak.default.tokenParsed.sub;
    let response = await fetch(`${this.BASE_URL}/cfp`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${keycloak.default.token}`
      },
      body: JSON.stringify(data)
    }).then(resp=>resp.json());
    return response;
  }

  async getTalks() {
    let data = await fetch(`${this.BASE_URL}/talk`, {
      headers: {
        "Authorization": `Bearer ${keycloak.default.token}`
      }
    }).then(resp=>resp.json());
    return data;
  }

  async postTalk(data) {
    data.created_by = keycloak.default.tokenParsed.sub;
    let response = await fetch(`${this.BASE_URL}/talk`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${keycloak.default.token}`
      },
      body: JSON.stringify(data)
    }).then(resp=>resp.json());
    return response;
  }
}

const api = new API({
  BASE_URL: config.BASE_URL
});

export default api;