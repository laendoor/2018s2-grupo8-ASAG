import React from 'react';
import { withRouter } from 'react-router';
import Ionicon from 'react-ionicons';
import '../dist/css/header.css';
import '../dist/css/align.css';
// import API from 'TraiFlix_api_rest\server.xtend'


class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = { search: '', user: 'Default' };
  }


  handleChange(event) {
    this.setState({ search: event.target.value });
  }

  handleSubmit() {
    this.props.history.push(`/search/${this.state.search}`);
  }

  goToHome() {
    this.props.history.push('/');
  }

  render() {
    return (
      <nav className="navbar navbar-light bg-light justify-content-between">
        <div className="form-inline">
          <button type="button" className="navbar-brand btn btn-link" onClick={() => this.goToHome()}> <Ionicon icon="ios-home" fontSize="35px" /> </button>
          <input
            className="form-control"
            placeholder="Buscar"
            type="text"
            onChange={event => this.handleChange(event)}
          />
          <button className="btn btn-outline-primary my-2 my-sm-0" type="submit" onClick={() => this.handleSubmit()}> <Ionicon icon="ios-search" color="Gray" /> </button>
        </div>
        <div align="center">
          <img src="https://vignette.wikia.nocookie.net/allficcion/images/5/5c/Chuck_Norris.jpg/revision/latest/scale-to-width-down/282?cb=20151118214226&path-prefix=es" alt="chuck norris" className="rounded-circle" width="30" />
          <h6>{this.state.user}</h6>
        </div>
      </nav>
    );
  }
}

export default withRouter(Header);
