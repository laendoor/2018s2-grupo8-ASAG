import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import { Link } from 'react-router-dom';
import API from '../service/api.js';
import '../dist/css/index.css';
import '../dist/css/singIn.css';
import '../dist/css/Card.css';
import Gallery from './Carousel';

class Search extends React.Component {
  constructor() {
    super();
    this.state = {
      searched: [],
      recomended: [],
      fauvorites: [],
      data: [],
    };
  }

  componentDidMount() {
    API.post('/search', { text: `${this.props.match.params.search}` })
      .then(response => this.setState({ searched: response.data }))
      .catch(console.log);

    API.get(`/${this.props.match.params.username}/favs`)
      .then(response => this.setState({ fauvorites: response.data }))
      .catch(console.log);

    API.get(`/${this.props.match.params.username}/recomended`)
      .then(response => this.setState({ recomended: response.data }))
      .catch(console.log);

    API.get('/categories')
      .then(cats => Promise.all(cats.data.map(cat => API.get(`/content/${cat}`))))
      .then(response => this.setState({
        data: response,
      }))
      .catch(console.log);
  }

  imgFromLink(content) {
    if (content.id.charAt(0) === 'M') {
      const id = content.link.substring(32, content.link.size);
      const img = 'https://img.youtube.com/vi/'.concat(id).concat('/0.jpg');
      return img;
    }
    const id = content.episodes[0].link.substring(32, content.episodes[0].link.size);
    const img = 'https://img.youtube.com/vi/'.concat(id).concat('/0.jpg');
    return img;
  }

  textRender(text) {
    return (
      <div>
        {text}
      </div>
    );
  }

  realeseContent(content) {
    if (content.id.charAt(0) === 'M') {
      return content.release;
    }
    return content.episodes[0].release;
  }

  createCardContent(content) {
    return (
      <div>
        <Link to={`/${(content.id.charAt(0) === 'M') ? 'movie' : 'serie'}/${this.props.match.params.username}/${content.id}`}>
          <div className="card mb-3 cardT">
            <img className="card imgT" src={this.imgFromLink(content)} alt="imagen de la primer escena" />
            <div className="card-body" align="center">
              <h5 className="card-title textT">{this.textRender(content.title)}</h5>
              <div className="card-text">
                <span className="badge badge-pill badge-success badgeMargin">{this.realeseContent(content)}</span>
              </div>
            </div>
          </div>
        </Link>
      </div>
    );
  }


  createRowContent(text, elem) {
    return (
      <div>
        <h1 className="text textBrown">{text}</h1>
        <Gallery listOfCards={elem.map(content => this.createCardContent(content))} />
      </div>
    );
  }


  render() {
    return (
      <main>
        {this.createRowContent('Busqueda', this.state.searched)}
        {this.createRowContent('Favoritos', this.state.fauvorites)}
        {this.createRowContent('Recomendados', this.state.recomended)}
        {this.state.data.map(elem => this.createRowContent(elem.category, elem.data))}
      </main>
    );
  }
}

export default Search;
