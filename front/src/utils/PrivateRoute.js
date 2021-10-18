import { useKeycloak } from "react-keycloak";
import React from "react";
import { Redirect, Route } from "react-router-dom";
import { useAuth0 } from "@auth0/auth0-react";

export function PrivateRoute({ component: Component, roles, ...rest }) {
  // const [keycloak] = useKeycloak();

  // const isAuthorized = roles => {
  //   if (keycloak && roles) {
  //     return roles.some(r => {
  //       const realm = keycloak.hasRealmRole(r);
  //       const resource = keycloak.hasResourceRole(r);
  //       return realm || resource;
  //     });
  //   }
  //   return false;
  // }
  const { user, isAuthenticated, isLoading } = useAuth0();
  const isAuthorized = () => isAuthenticated;

  return (
    <Route {...rest} render={props => {
      return isAuthorized(roles) ? <Component {...props} /> : <Redirect to={{ pathname: "/" }} />
    }} />
  )
}