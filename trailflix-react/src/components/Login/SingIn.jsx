import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/singIn.css';

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
      <div className="form-headin">
        <h1>TRAIFLIX</h1>
        <div className="login-form">
          <div className="main-div">

            <div className="panel">
              <h2>Login</h2>
            </div>
            <div className="form-group">

              <input
                className="form-input"
                type="text"
                placeholder="Ingrese su usuario"
                onChange={event => this.setState({ user: event.target.value })}
              />
              <button
                className="btn btn-primary"
                type="button"
                onClick={() => this.SingUp()}
              >
              Sing In
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default SingIn;
