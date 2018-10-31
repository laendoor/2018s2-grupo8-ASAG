import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import API from '../service/Api';
import '../dist/css/home.css';
import '../dist/css/singIn.css';
import '../dist/css/Card.css';
import Gallery from './Carousel';


class Home extends React.Component {
  constructor() {
    super();
    this.state = {
      recomended: [],
      fauvorites: [],
      categories: [],
    };
  }

  componentDidMount() {
    API.get(`/${this.props.match.params.username}/favs`)
      .then(response => this.setState({ fauvorites: response.data }))
      .catch(console.log);

    API.get('/categories')
      .then(response => this.setState({ categories: response.data }))
      .catch(console.log);

    API.get(`/${this.props.match.params.username}/recomended`)
      .then(response => this.setState({ recomended: response.data }))
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
        <div className="card mb-3 cardT">
          <img className="card imgT" src={this.imgFromLink(content)} alt="imagen de la primer escena" />
          <div className="card-body" align="center">
            <h5 className="card-title textT">{this.textRender(content.title)}</h5>
            <div className="card-text">
              <span className="badge badge-pill badge-success badgeMargin">{this.realeseContent(content)}</span>
            </div>
          </div>
        </div>
      </div>
    );
  }

  createRowContent(elem) {
    return <Gallery listOfCards={elem.map(content => this.createCardContent(content))} />;
  }

  createRowContentCategories() {
    return this.state.categories.map(elem => (
      <div>
        <h1 className="text textBlue">{elem}</h1>
        {this.createRowContent([this.state[`${elem}`]])}
      </div>
    ));
  }


  render() {
    return (
      <main>
        <div>
          <h1 className="text textBlue">Favoritos</h1>
          {this.createRowContent(this.state.fauvorites)}
        </div>
        <div>
          <h1 className="text textBlue">Recomendados</h1>
          {this.createRowContent(this.state.recomended)}
        </div>
        <div>
          <h1 className="text textBlue">Action</h1>
          {}
        </div>
      </main>
    );
  }
}

export default Home;
