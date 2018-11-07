import React from 'react';
import { withRouter } from 'react-router';
import Ionicon from 'react-ionicons';
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

  render() {
    return (
      <nav className="navbar navbar-light justify-content-between ">
        <div className="form-inline row">
          <div className="col-md-5">
            <label className="form-logo" onClick={() => this.goToHome()}>TRAILFLIX</label>
          </div>
          <div id="search" className="col-md-6">
            <input onChange={event => this.handleChange(event)} onKeyUp={this.handleKeyUp} value={this.state.searchTerm} placeholder="Buscar" />
          </div>
          <div className="col-md-1">
            <button className="btn btn-outline-danger my-2 my-sm-0" type="submit" onClick={() => this.handleSubmit()}> <Ionicon icon="ios-search" color="Gray" /> </button>
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
