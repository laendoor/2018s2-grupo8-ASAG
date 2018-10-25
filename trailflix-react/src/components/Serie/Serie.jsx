import React from 'react';
import '../../dist/css/Serie.css';
import ReactPlayer from 'react-player';
import API from '../../service/Api.js';


function zeroLeftPad(num, size) {
  let s = `${num}`;
  while (s.length < size) s = `0${s}`;
  return s;
}

export default class Serie extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      serie: {
        title: '',
        categories: [
          {
            name: '',
          },
        ],
        clasification: {
          name: '',
        },
        creators: '',
        relateds: [],
        rating: 0,
        episodes: [{
          id: '',
          title: '',
          release: '',
          assessments: [],
          duration: 0,
          directors: '',
          actors: '',
          link: '',
          season: 0,
          episodeNumber: 0,
          rating: 0,
        }],
      },
      defaultImage: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
    };
  }

  componentDidMount() {
    console.log(`Logged in user: ${this.loggedInUser()}`);
    console.log(`Serie id: ${this.props.match.params.id}`);

    if (this.props.match.params.id) {
      API.get(`/${this.loggedInUser()}/serie/${this.props.match.params.id}`)
        .then(response => this.setState({ serie: response }))
        .catch(console.log);
    }
  }

  removeFromWatched() {
    API.put(`/${this.loggedInUser()}/watched/serie/${this.props.match.params.id}/false`)
      .then(response => this.setState({ serie: response }))
      .catch(console.log);
  }

  recommend() {
    // TO DO - Implementar
  }

  removeFromFavourites() {
    API.put(`/${this.loggedInUser()}/fav/serie/${this.props.match.params.id}/false`)
      .then(response => this.setState({ serie: response }))
      .catch(console.log);
  }

  goBack() {
    this.props.history.goBack();
  }

  loggedInUser() {
    return localStorage.getItem('loggedInUser');
  }

  change(property, event) {
    const currentSerie = this.state.serie;
    this.setState({ serie: { ...currentSerie, [property]: event.target.value } });
  }

  classification() {
    return this.state.serie.clasification.name;
  }

  categories() {
    return this.state.serie.categories.map(category => category.name).join(', ');
  }

  releaseYear() {
    return this.state.serie.episodes[0].release === null ? '[Fecha lanzamiento]' : this.state.serie.episodes[0].release;
  }

  renderEpisodes() {
    return this.state.serie.episodes.map(episode => (
      <li className="list-group-item" key={episode.id}>
        <h4 className="mb-1">S{zeroLeftPad(episode.season, 2)}E{zeroLeftPad(episode.episodeNumber, 2)}</h4>
        <p className="mb-1">{episode.title}</p>
      </li>
    ));
  }

  render() {
    return (
      <div className="form-headin">
        <div className="row">
          <div className="col-6">
            <h1>{this.state.serie.title}</h1>
            <h5 className="card-title">{this.classification()} | {this.categories()} | {this.releaseYear()} </h5>
            <ReactPlayer
              url={this.state.serie.episodes[0].link}
              className="react-player"
              width="100%"
              height="80%"
              controls
            />
          </div>
          <div className="col-4">
            <button type="button" className="btn btn-primary btn-lg btn-block" disabled>CAPITULOS</button>
            <ul className="list-group list-group-flush">
              {this.renderEpisodes()}
            </ul>
            <button type="button" className="btn btn-success btn-lg btn-block" onClick={() => this.removeFromFavourites()}>Quitar de Favoritos</button>
            <button type="button" className="btn btn-success btn-lg btn-block" onClick={() => this.removeFromWatched()}>Marcar como No Vista</button>
            <button type="button" className="btn btn-warning btn-lg btn-block" onClick={() => this.recommend()}>Recomendar</button>
            <button type="button" className="btn btn-secondary btn-lg btn-block" onClick={() => this.goBack()}>Atras</button>
          </div>
        </div>
      </div>
    );
  }
}
