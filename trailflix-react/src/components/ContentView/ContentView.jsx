import React from 'react';
import '../../dist/css/ContentView.css';
import ReactPlayer from 'react-player';
import Rating from '../Rating';
import API from '../../service/Api.js';


export default class ContentView extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: {
        title: '',
        categories: [{
          name: '',
        },
        ],
        clasification: {
          name: '',
        },
        release: '',
        link: '',
        relateds: [],
        rating: 0,
        episodes: [{
          title: '',
          release: '',
          link: '',
          season: 0,
          episodeNumber: 0,
        }],
      },
    };
  }

  componentDidMount() {
    console.log(`Logged in user: ${this.getUserName()}`);
    console.log(`Content id: ${this.props.match.params.id}`);

    if (this.props.match.params.id) {
      API.get(`/${this.getUserName()}/${this.getContentType()}/${this.props.match.params.id}`)
        .then(response => this.setState({ content: response }))
        .catch(console.log);
    }
  }

  getContentTitle() {
    return this.state.content.title;
  }

  getUserName() {
    return this.props.location.state.userName;
  }

  getClassification() {
    return this.state.content.clasification.name;
  }

  getCategories() {
    return this.state.content.categories.map(category => category.name).join(', ');
  }

  getContentRating() {
    return this.state.content.rating;
  }

  removeFromWatched() {
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch(console.log);
  }

  removeFromFavourites() {
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch(console.log);
  }

  recommend() {
    // TO DO - Implementar
  }

  render() {
    return (
      <div className="form-headin">
        <div className="row">
          <div className="col-6">
            <h1>{this.getContentTitle()}</h1>
            <h5 className="card-title">{this.getDetails()}<Rating stars="5" value={this.getContentRating()} /></h5>
            <ReactPlayer
              url={this.getTrailerLink()}
              className="react-player"
              width="100%"
              height="80%"
              controls
            />
          </div>
          <div className="col-4">
            <button type="button" className="btn btn-primary btn-lg btn-block" disabled>{this.getItemListTitle()}</button>
            <ul className="list-group list-group-flush">
              {this.renderItemList()}
            </ul>
            <button type="button" className="btn btn-success btn-lg btn-block" onClick={() => this.removeFromFavourites()}>Quitar de Favoritos</button>
            <button type="button" className="btn btn-success btn-lg btn-block" onClick={() => this.removeFromWatched()}>Marcar como No Visto</button>
            <button type="button" className="btn btn-warning btn-lg btn-block" onClick={() => this.recommend()}>Recomendar</button>
          </div>
        </div>
      </div>
    );
  }
}
