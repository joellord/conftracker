import './App.css';
import React from "react";
import { AppRouter } from "./routes";

import "@patternfly/patternfly/patternfly.css"

function App() {
  return (
    <div className="App">
      <AppRouter />
    </div>
  );
}

export default App;
