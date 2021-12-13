import React from "react";
import { Redirect, Route } from "react-router-dom";
import API from "../api";

export function PrivateRoute({ component: Component, roles, ...rest }) {
  const isAuthorized = () => API.userIsLoggedIn;

  return (
    <Route {...rest} render={props => {
      return isAuthorized(roles) ? <Component {...props} /> : <Redirect to={{ pathname: "/" }} />
    }} />
  )
}