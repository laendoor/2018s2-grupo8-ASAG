import React from 'react';
import Header from './Header.jsx';

export default class Root extends React.Component {
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
        <Header userState={this.props.userState} />
        <div className="container">
          {this.props.children}
        </div>
      </div>
    );
  }
}
