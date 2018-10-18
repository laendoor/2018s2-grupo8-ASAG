import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../dist/css/App.css';

import React from 'react';

import { BrowserRouter } from 'react-router-dom';

import Root from './Root.jsx';

export default class App extends React.Component {
  constructor() {
    super();
    this.state = { name: 'mundo' };
  }

  render() {
    return (
      <BrowserRouter>
        <Root>
          <h1>Hola {this.state.name}</h1>
        </Root>
      </BrowserRouter>
    );
  }
}
