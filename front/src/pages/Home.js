import React from "react";
import { Page, PageHeader, PageSection, PageSectionVariants } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
import { useAuth0 } from "@auth0/auth0-react";
import LoginButton from "../components/LoginButton";
import api from "../api";

const Home = () => {
  
  const Header = (
    <PageHeader logo="#" />
  )
  
  const { isAuthenticated, getAccessTokenSilently, getIdTokenClaims } = useAuth0();

  return (
    <Page header={Header}>
      <PageSection variant={PageSectionVariants.dark}>
        <h1>Welcome!</h1>
        <p>Please login</p>

      {isAuthenticated && api.setTokens(getAccessTokenSilently(), getIdTokenClaims()) ?
        <div><Redirect to="/cfp" /></div>
        : <h2>Error logging in</h2>
      }

      <LoginButton />

      </PageSection>
    </Page>
    )
}

export default Home;