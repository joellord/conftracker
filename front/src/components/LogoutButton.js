import React from "react";
// import { useAuth0 } from "@auth0/auth0-react";
import { Button } from "@patternfly/react-core";
import API from "../api";

const LogoutButton = () => {
  // const { logout } = useAuth0();
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