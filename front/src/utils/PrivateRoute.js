import React from "react";
import { Redirect, Route } from "react-router-dom";
import { useAuth0 } from "@auth0/auth0-react";

export function PrivateRoute({ component: Component, roles, ...rest }) {
  const { isAuthenticated } = useAuth0();
  const isAuthorized = () => isAuthenticated;

  return (
    <Route {...rest} render={props => {
      return isAuthorized(roles) ? <Component {...props} /> : <Redirect to={{ pathname: "/" }} />
    }} />
  )
}