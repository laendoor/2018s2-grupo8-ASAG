import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import '../../dist/css/singIn.css';
import API from '../../service/api.js';


class SingIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      errorMessage: '',
    };
  }

  handleError(error) {
    this.setState({ errorMessage: (error.response.data.message) });
  }

  SingUp() {
    API.post('/auth', { ...this.state })
      .then(() => this.props.history.push(`/home/${this.state.username}`))
      .catch(error => this.handleError(error));
  }

  messageError() {
    return (
      (this.state.errorMessage) ? (
        <div className="alert alert-danger" role="alert">
          {this.state.errorMessage}
        </div>) : <div />
    );
  }

  handleKeyPress(event) {
    if (event.key === 'Enter') {
      this.setState({ username: event.target.value });
      this.SingUp();
    }
  }

  changeInput(event) {
    this.setState({ username: event.target.value, errorMessage: '' });
  }

  render() {
    return (
      <div className="form-headin">
        <h1 className="form-logo h1">TRAIFLIX</h1>
        <div className="login-form">

          <div className="main-div">
            { this.messageError() }
            <div className="panel">
              <h2>Login</h2>
            </div>
            <div className="form-group">
              <input
                className="form-input"
                type="text"
                placeholder="Ingrese su usuario"
                onKeyPress={event => this.handleKeyPress(event)}
                onChange={event => this.changeInput(event)}
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
