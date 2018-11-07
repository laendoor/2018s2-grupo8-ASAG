import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/singIn.css';
import '../../dist/css/header.css';
import API from '../../service/api.js';


class SingIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
    };
  }

  SingUp() {
    API.post('/auth', { ...this.state })
      .then(() => this.props.history.push(`/home/${this.state.username}`))
      .catch(console.log);
  }

  render() {
    return (
      <div className="form-headin">
        <h1 className="form-logo">TRAIFLIX</h1>
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
                onChange={event => this.setState({ username: event.target.value })}
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
