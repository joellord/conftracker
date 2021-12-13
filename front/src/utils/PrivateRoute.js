import React from "react";
import { Redirect, Route } from "react-router-dom";
import API from "../api";

// import { useAuth0 } from "@auth0/auth0-react";

export function PrivateRoute({ component: Component, roles, ...rest }) {
  // const { isAuthenticated } = true;
  // const isAuthorized = () => isAuthenticated;
  // const [user, setUser] = React.useState(app.currentUser);
  const isAuthorized = () => API.userIsLoggedIn;
  // debugger;

  return (
    <Route {...rest} render={props => {
      return isAuthorized(roles) ? <Component {...props} /> : <Redirect to={{ pathname: "/" }} />
    }} />
  )
}