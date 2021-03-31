import React from "react";
import {BrowserRouter as Router, Route, Switch} from "react-router-dom";
import logo from './logo.svg';
import './App.css';

function App() {
  return (

      <Router>
        <Switch>
          {/* Route Insertion Point (do not change this text, it is being used by hygen cli) */}

          <Route path="/">
            {defaultLanding}
          </Route>
        </Switch>
      </Router>

  );
}
const defaultLanding = () =>{
  return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
              className="App-link"
              href="https://reactjs.org"
              target="_blank"
              rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
      </div>
  )
}

export default App;
