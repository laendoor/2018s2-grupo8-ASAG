import React from 'react';
import '../../dist/css/ContentView.css';
import ReactPlayer from 'react-player';
import Rating from '../Rating';
import API from '../../service/api.js';


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
        .catch();
    }
  }

  getContentTitle() {
    return this.state.content.title;
  }

  getUserName() {
    return this.props.match.params.username;
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

  extractYear(dateString) {
    return dateString.substring(6, dateString.lenght);
  }

  removeFromWatched() {
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch();
  }

  removeFromFavourites() {
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch();
  }

  recommend() {
    // TO DO - Implementar
  }

  convertStringDateToDate() {
    const date = this.getRelease();
    const day = date.substring(0, 2);
    const month = date.substring(3, 5);
    const year = date.substring(6, 10);
    const contentDate = new Date(year, month, day);
    return contentDate;
  }

  render() {
    const date = new Date();
    if (date.getTime() > this.convertStringDateToDate(date).getTime()) {
      return (
        <div className="form-headin">
          <div className="row">
            <div className="col-7">
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
              <button type="button" className="btn btn-danger btn-lg btn-block" disabled>{this.getItemListTitle()}</button>
              <ul className="list-group list-group-flush">
                {this.renderItemList()}
              </ul>
              <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.removeFromFavourites()}>Quitar de Favoritos</button>
              <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.removeFromWatched()}>Marcar como No Visto</button>
              <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.recommend()}>Recomendar</button>
            </div>
          </div>
        </div>
      );
    }
    return (
      <div className="form-headin">
        <div className="row">
          <div className="col-7">
            <h1>{this.getContentTitle()}</h1>
            <img src="http://www.techschemes.com/wp-content/uploads/2018/01/Fix-This-Video-is-not-available-in-your-Country-Error-on-YouTube.png?x92713" className="img-fluid" alt="Sorry about that" />
          </div>
          <div className="col-4">
            <button type="button" className="btn btn-danger btn-lg btn-block" disabled>{this.getItemListTitle()}</button>
            <ul className="list-group list-group-flush">
              {this.renderItemList()}
            </ul>
            <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.removeFromFavourites()}>Quitar de Favoritos</button>
            <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.removeFromWatched()}>Marcar como No Visto</button>
            <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.recommend()}>Recomendar</button>
          </div>
        </div>
      </div>
    );
  }
}
