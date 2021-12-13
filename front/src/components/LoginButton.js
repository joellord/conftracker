import React from "react";
// import { useAuth0 } from "@auth0/auth0-react";
import { Button } from "@patternfly/react-core";
import API from "../api";

const LoginButton = () => {
  // const { loginWithRedirect } = useAuth0();

  const login = () => {
    API.userLogin();
  }

  return <Button onClick={() => login()}>Log In</Button>;
};

export default LoginButton;