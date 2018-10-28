import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'open-iconic/font/css/open-iconic-bootstrap.min.css';
import API from '../service/Api';
import Container from './Container.jsx';
import '../dist/css/home.css';
import '../dist/css/singIn.css';
import '../dist/css/Card.css';
import Gallery from './Carousel';


class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: 'Saba',
      recomended: [],
      fauvorites: [],
      categories: [],
    };
  }

  componentDidMount() {
    API.get(`/${this.state.user}/favs`)
      .then(response => this.setState({ fauvorites: response }))
      .catch(console.log);
  }

  splitContentOn(content, number) {
    const numberOfRows = Math.ceil((content ? content.length : 0) / number);
    const splitedContent = [];
    for (let i = 0; i < numberOfRows; i += 1) {
      splitedContent.push(content.slice(i * number, number * (i + 1)));
    }
    return splitedContent;
  }

  createFauvoriteContentRow() {
    return this.splitContentOn(this.state.fauvorites, 5).map((list, i) => (
      <div className="card-deck paddingT" key={`card_${i}`}>
        {list.map(elem => this.createCardContent(elem))}
      </div>
    ));
  }

  imgFromLink(link) {
    const id = link.substring(32, link.size);
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

  createCardContent(content) {
    return (
      <div>
        <div className="card mb-3 cardT">
          <img className="card imgT" src={this.imgFromLink(content.link)} alt="imagen de la primer escena" />
          <div className="card-body" align="center">
            <h5 className="card-title textT">{this.textRender(content.title)}</h5>
            <div className="card-text">
              <span className="badge badge-pill badge-success badgeMargin">{content.realese}</span>
            </div>
          </div>
        </div>
      </div>
    );
  }


  createCardExample() {
    return (
      <div className="card">
        <img className="card-img-top" src="https://vignette.wikia.nocookie.net/allficcion/images/5/5c/Chuck_Norris.jpg/revision/latest/scale-to-width-down/282?cb=20151118214226&path-prefix=es" alt="Card cap" />
        <div className="card-body">
          <h5 className="card-title">Card title</h5>
          <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </div>
    );
  }

  render() {
    return (
      <main>
        <h1 className="text-muted">Favoritos</h1>
        <Gallery listOfCards={this.state.fauvorites.map(elem => this.createCardContent(elem))} />
        {/* <div>
          <h1>Recomendados</h1>
          {this.createRecomendedContentRow()}
        </div>
        <div>
          {this.createContentRowBaseInCategories()}
        </div>
        */}
      </main>
    );
  }
}

export default Home;
