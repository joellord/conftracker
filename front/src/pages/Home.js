import React from "react";
import { Page, PageHeader, PageSection, PageSectionVariants } from "@patternfly/react-core";
import { Redirect } from "react-router-dom";
import LoginButton from "../components/LoginButton";
import API from "../api";

const Home = () => {
  
  const Header = (
    <PageHeader logo="#" />
  )
  
  const isAuthenticated = API.userIsLoggedIn();

  return (
    <Page header={Header}>
      {isAuthenticated && 
        <div><Redirect to="/cfp" /></div>
      }
      
      <PageSection variant={PageSectionVariants.dark}>
        <h1>Welcome!</h1>
        <p>Please login</p>
        <LoginButton />

      </PageSection>
    </Page>
    )
}

export default Home;