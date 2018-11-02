import React from 'react';
import { withRouter } from 'react-router';
import Header from './Header.jsx';


class Root extends React.Component {
  render() {
    if (window.location.pathname === '/') {
      return (
        <div className="container">
          {this.props.children}
        </div>
      );
    }

    return (
      <div>
        <Header username={this.props.location.pathname.split('/')[2]} />
        <div className="container">
          {this.props.children}
        </div>
      </div>
    );
  }
}

export default withRouter(Root);
