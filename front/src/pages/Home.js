import React from "react";
import { Page, PageHeader, PageSection, PageSectionVariants } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
// import { useAuth0 } from "@auth0/auth0-react";
import LoginButton from "../components/LoginButton";
import API from "../api";

const Home = () => {
  
  const Header = (
    <PageHeader logo="#" />
  )
  
  // const { isAuthenticated, getAccessTokenSilently, getIdTokenClaims } = useAuth0();
  const isAuthenticated = API.userIsLoggedIn();


  return (
    <Page header={Header}>
      <PageSection variant={PageSectionVariants.dark}>
        <h1>Welcome!</h1>
        <p>Please login</p>

      {isAuthenticated && 
        <div><Redirect to="/cfp" /></div>
      }

      <LoginButton />

      </PageSection>
    </Page>
    )
}

export default Home;