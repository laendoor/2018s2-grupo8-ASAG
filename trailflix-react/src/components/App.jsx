import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/App.css';
import '../dist/css/Card.css';
import '../dist/css/singIn.css';
import { Switch, Route } from 'react-router';
import { BrowserRouter } from 'react-router-dom';
import Home from './Home';
import SingIn from './Login/SingIn';
import Header from './Header';


export default class App extends React.Component {
  constructor() {
    super();
    this.state = { name: 'mundo' };
  }

  render() {
    return (
      <BrowserRouter>

        <Switch>
          <Route path="/" component={Home} />
        </Switch>

      </BrowserRouter>
    );
  }
}
