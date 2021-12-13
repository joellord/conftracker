import React from "react";
import { Button } from "@patternfly/react-core";
import API from "../api";

const LoginButton = () => {
  const login = () => {
    API.userLogin();
  }

  return <Button onClick={() => login()}>Log In</Button>;
};

export default LoginButton;