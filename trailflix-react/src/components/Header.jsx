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
            <button className="btn btn-outline-primary my-2 my-sm-0" type="submit" onClick={() => this.handleSubmit()}> <Ionicon icon="ios-search" color="Gray" /> </button>
          </div>
        </div>
        <div className="textT" align="center">
          <img src="https://vignette.wikia.nocookie.net/allficcion/images/5/5c/Chuck_Norris.jpg/revision/latest/scale-to-width-down/282?cb=20151118214226&path-prefix=es" alt="chuck norris" className="rounded-circle" width="30" />
          <h6>{this.props.username}</h6>
        </div>
      </nav>
    );
  }

}

export default withRouter(Header);
