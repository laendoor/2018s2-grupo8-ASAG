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
import SerieView from './ContentView/SerieView';
import MovieView from './ContentView/MovieView';
import Root from './Root';


export default class App extends React.Component {
  constructor() {
    super();
    this.state = {
      name: 'TRAIFLIX',
    };
  }

  render() {
    return (
      <BrowserRouter>
        <Root>
          <Switch>
            <Route path="/home/:username" render={props => <Home {...props} />} />
            <Route path="/serie/:username/:id" render={props => <SerieView {...props} />} />
            <Route path="/movie/:username/:id" render={props => <MovieView {...props} />} />
            <Route path="/" render={props => <SingIn {...props} />} />
          </Switch>
        </Root>
      </BrowserRouter>
    );
  }
}
