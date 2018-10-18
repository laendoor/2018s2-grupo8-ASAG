import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/App.css';
import { Switch, Route } from 'react-router';

import React from 'react';

import { BrowserRouter } from 'react-router-dom';

import SingIn from './Login/SingIn';

export default class App extends React.Component {
  constructor() {
    super();
    this.state = { name: 'mundo' };
  }

  render() {
    return (
      <BrowserRouter>
        <Switch>
          <Route path="/app" component={App} />
          <Route path="/singin" component={SingIn} />
        </Switch>
      </BrowserRouter>
    );
  }
}
