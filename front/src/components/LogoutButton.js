import React from "react";
import { Button } from "@patternfly/react-core";
import API from "../api";

const LogoutButton = () => {
  const logout = async () => {
    await API.userLogout();
    console.log("Logged out, redirecting");
    window.location.href = window.location.origin;
  }

  return (
    <Button onClick={() => logout()}>
      Log Out
    </Button>
  );
};

export default LogoutButton;