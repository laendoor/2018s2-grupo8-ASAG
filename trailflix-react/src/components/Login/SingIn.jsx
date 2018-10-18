import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';

import React from 'react';

class SingIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: '',
    };
  }

  SingUp() {
    console.log('this.state', this.state.user);
  }

  render() {
    return (
      <div className="form-inline">
        <h2>Loguin</h2>
        <div className="form-group">
          <input
            className="form-control"
            type="text"
            placeholder="Ingrese su usuario"
            onChange={event => this.setState({ user: event.target.value })}
          />
          <button
            className="btn btn-primary"
            type="button"
            value="Continuar"
            onClick={() => this.SingUp()}
          />
        </div>
      </div>
    );
  }
}

export default SingIn;
