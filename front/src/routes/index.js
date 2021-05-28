import { useKeycloak } from "react-keycloak";

import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";

import Home from "../pages/Home";
import { PrivateRoute } from "../utils/PrivateRoute";
import Cfp from "../pages/Cfp";
import CfpSubmit from "../pages/Cfp/Submit";
import CfpApproved from "../pages/Cfp/Approved";
import Talk from "../pages/Talk";
import Upcoming from "../pages/Upcoming";
import Profile from "../pages/Profile";

export const AppRouter = () => {
  const [, initialized] = useKeycloak();
  if (!initialized) {
    return <div>Loading...</div>
  }

  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Home} />
        <PrivateRoute roles={['user']} path="/cfp/approved/:cfpId" component={CfpApproved} />
        <PrivateRoute roles={['user']} path="/cfp/submit/:cfpId" component={CfpSubmit} />
        <PrivateRoute roles={['user']} path="/cfp" component={Cfp} />
        <PrivateRoute roles={['user']} path="/talk" component={Talk} />
        <PrivateRoute roles={['user']} path="/upcoming" component={Upcoming} />
        <PrivateRoute roles={['user']} path="/profile" component={Profile} />
      </Switch>
    </BrowserRouter>
  )
}