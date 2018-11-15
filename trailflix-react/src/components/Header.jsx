import React from 'react';
import { withRouter } from 'react-router';
import '../dist/css/header.css';

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      search: '',
    };
  }

  handleChange(event) {
    this.setState({ search: event.target.value });
  }

  handleSubmit() {
    this.props.history.push(`/search/${this.props.username}/${this.state.search}`);
    document.getElementById('input').value = '';
  }

  goToHome() {
    this.props.history.push(`/home/${this.props.username}`);
  }

  dropdown(text) {
    return (
      <div className="btn-group dropleft">
        <button type="button" className="btn btn-danger button-brown dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {text}
        </button>
        <div className="dropdown-menu dropdown-menu-right">
          <button className="dropdown-item" type="button">Setting</button>
          <div className="dropdown-divider" />
          <a className="dropdown-item" href="/">Sing Out</a>
        </div>
      </div>
    );
  }

  handleKeyPress(event) {
    if (event.key === 'Enter') {
      this.setState({ search: event.target.value });
      if (!this.state.search) {
        this.state.search = 'ALL';
      }
      this.handleSubmit();
    }
  }

  render() {
    return (
      <nav className="navbar navbar-light justify-content-between ">
        <div className="form-inline row">
          <div className="col-md-6">
            <label className="form-logo" onClick={() => this.goToHome()}>TRAILFLIX</label>
          </div>
          <div id="search" className="col-md-6">
            <input id="input" onChange={event => this.handleChange(event)} onKeyUp={this.handleKeyUp} onKeyPress={event => this.handleKeyPress(event)} value={this.state.searchTerm} placeholder="Buscar" />
          </div>

        </div>
        <div className="textT" align="center">
          {this.dropdown(this.props.username)}
        </div>
      </nav>
    );
  }
}

export default withRouter(Header);
