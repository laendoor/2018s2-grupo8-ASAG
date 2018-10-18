import React from 'react';
import { withRouter } from 'react-router';
import Ionicon from 'react-ionicons';


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
        <div>
          <Ionicon icon="md-contact" fontSize="50px" />
          <h6>{this.state.user}</h6>
        </div>
      </nav>
    );
  }
}

export default withRouter(Header);
