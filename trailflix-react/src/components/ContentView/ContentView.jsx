import React from 'react';
import '../../dist/css/ContentView.css';
import ReactPlayer from 'react-player';
import Rating from '../Rating';
import API from '../../service/api.js';
import Ionicon from 'react-ionicons';


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
      fav: '',
      watched: '',
    };
  }

  componentDidMount() {
    console.log(`Logged in user: ${this.getUserName()}`);
    console.log(`Content id: ${this.props.match.params.id}`);

    if (this.props.match.params.id) {
      API.get(`/${this.getUserName()}/content/${this.props.match.params.id}`)
        .then(response => this.setState({ content: response }))
        .catch();
    }

    if (this.props.match.params.id) {
      this.isFav();
    }

    if (this.props.match.params.id) {
      this.isWatched();
    }
  }

  isFav() {
    API.get(`/${this.getUserName()}/content/${this.props.match.params.id}/isFav`)
      .then(response => this.setState({ fav: response }))
      .catch();
  }

  isWatched() {
    API.get(`/${this.getUserName()}/content/${this.props.match.params.id}/isWatched`)
      .then(response => this.setState({ watched: response }))
      .catch();
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
    this.isWatched();
    API.put(`/${this.getUserName()}/watched/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch();
  }

  addToMyWatched() {
    this.isWatched();
    API.put(`/${this.getUserName()}/watched/${this.getContentType()}/${this.props.match.params.id}/true`)
      .catch();
  }

  removeFromFavourites() {
    this.isFav();
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/false`)
      .catch();
  }

  addToMyFavourites() {
    this.isFav();
    API.put(`/${this.getUserName()}/fav/${this.getContentType()}/${this.props.match.params.id}/true`)
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

  addOrRemoveFavourites() {
    return this.state.fav ? 'Quitar de Favoritos' : 'Agregar a favoritos';
  }

  addOrRemoveWatched() {
    return this.state.watched ? 'Marcar como no visto' : 'Marcar como visto';
  }

  iconForFav() {
    return (
      this.state.fav ? <Ionicon icon="md-remove-circle" fontSize="35px" /> : <Ionicon icon="md-add-circle" fontSize="35px" />
    );
  }

  iconForWatched() {
    return (
      this.state.watched ? <Ionicon icon="md-eye-off" fontSize="35px" /> : <Ionicon icon="md-eye" fontSize="35px" />
    );
  }

  render() {
    const date = new Date();
    if (date.getTime() > this.convertStringDateToDate(date).getTime()) {
      return (
        <div className="form-headin">
          <div className="row">
            <div className="col-7">
              <h1>{this.getContentTitle()}</h1>
              <h5 className="card-title" data-toggle="tooltip" data-placement="top" title={this.getDetailsForTooltips()}>{this.getDetails()}<Rating stars="5" value={this.getContentRating()} /></h5>
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
              <button
                type="button"
                className="btn btn-danger btn-lg btn-block"
                onClick={
                  () => (this.state.fav ? this.removeFromFavourites() : this.addToMyFavourites())}
              >
                {this.iconForFav()}
                {this.addOrRemoveFavourites()}
              </button>
              <button
                type="button"
                className="btn btn-danger btn-lg btn-block"
                onClick={
                () => (this.state.watched ? this.removeFromWatched() : this.addToMyWatched())}
              >
                {this.iconForWatched()}
                {this.addOrRemoveWatched()}
              </button>
              <button type="button" className="btn btn-danger btn-lg btn-block" onClick={() => this.recommend()}>
                <Ionicon icon="md-share-alt" fontSize="35px" />
                Recomendar
              </button>
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
          <h3>
            <span>
              Lamentablemente este video aun no ha sido publicado.
              Cuando se estrene seras el primero en verlo!
            </span>
          </h3>
        </div>
      </div>
    );
  }
}
