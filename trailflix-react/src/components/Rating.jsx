import React from 'react';

export default class Rating extends React.Component {
  getStarStyle(position) {
    return { color: (position <= this.props.value ? 'orangered' : 'dimgray') };
  }

  renderStars() {
    return Array.from({ length: this.props.stars },
      (item, index) => <span className="oi oi-star" style={this.getStarStyle(index)} key={index} />);
  }

  render() {
    return (
      <div>
        {this.renderStars()}
      </div>
    );
  }
}
