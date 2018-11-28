import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import { Link } from 'react-router-dom';
import API from '../service/api.js';
import '../dist/css/Card.css';
import '../dist/css/Tooltip.css';
import Rating from './Rating.jsx';


import Gallery from './Carousel';

class Home extends React.Component {
  constructor() {
    super();
    this.state = {
      recomended: [],
      fauvorites: [],
      data: [],
    };
  }

  componentDidMount() {
    API.get(`/${this.props.match.params.username}/favs`)
      .then(response => this.setState({ fauvorites: response.data }))
      .catch();

    API.get(`/${this.props.match.params.username}/recomended`)
      .then(response => this.setState({ recomended: response.data }))
      .catch();

    API.get('/categories')
      .then(cats => Promise.all(cats.data.map(cat => API.get(`/content/${cat}`))))
      .then(response => this.setState({
        data: response,
      }))
      .catch();
  }

  imgFromLink(content) {
    const id = content.link.substring(32, content.link.size);
    const img = 'https://img.youtube.com/vi/'.concat(id).concat('/0.jpg');
    return img;
  }

  textRender(text) {
    return (
      <div>
        {text.substring(0, 25)}
      </div>
    );
  }

  createCardContent(content) {
    return (
      <div>
        <Link to={`/${(content.id.charAt(0) === 'M') ? 'movie' : 'serie'}/${this.props.match.params.username}/${content.id}`}>
          <div className="card mb-3 cardT">
            <img className="card imgT" src={this.imgFromLink(content)} alt="imagen de la primer escena" />
            <div className="card-body" align="center">
              <h5 className="card-title textT tooltip">
                {this.textRender(content.title)}
                <span className="tooltiptext">
                  {content.title}
                </span>
              </h5>
              <div className="card-text">
                <span className="badge badge-pill badge-success badgeMargin">{content.release}</span>
              </div>
              <Rating stars="5" value={content.rating} />
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

  createRowContentOfCategories() {

  }

  render() {
    return (
      <main>
        {this.createRowContent('Favoritos', this.state.fauvorites)}
        {this.createRowContent('Recomendados', this.state.recomended)}
        {this.state.data.map(elem => this.createRowContent(elem.category, elem.data))}
      </main>
    );
  }
}

export default Home;
