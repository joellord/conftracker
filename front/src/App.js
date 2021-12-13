import './App.css';
import React from "react";
import { AppRouter } from "./routes";

import "@patternfly/patternfly/patternfly.css"
import * as Realm from "realm-web";

const app = new Realm.App({ id: "application-0-konnn" });

function App() {
  const [user, setUser] = React.useState(app.currentUser);

  if (!user) {
    // The redirect URI should be on the same domain as this app and
    // specified in the auth provider configuration.
    // const redirectUri = "http://localhost:3000";
    // const credentials = Realm.Credentials.google(redirectUri, {openId: true});

    // // Calling logIn() opens a Google authentication screen in a new window.
    // app.logIn(credentials).then(user => {
    // // The logIn() promise will not resolve until you call `handleAuthRedirect()`
    // // from the new window after the user has successfully authenticated.
    //   console.log(`Logged in with id: ${user.id}`);
    // })

    // // When the user is redirected back to your app, handle the redirect to
    // // save the user's access token and close the redirect window. This
    // // returns focus to the original application window and automatically
    // // logs the user in.
    // Realm.handleAuthRedirect();
  }

  return (
    <div className="App">
      <AppRouter />

      {/* <h1>Hello {user.id}</h1> */}
    </div>
  );
}

export default App;
