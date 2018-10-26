import React from 'react';
import ContentView from './ContentView';

export default class MovieView extends ContentView {
  componentDidMount() {
    super.componentDidMount();
  }

  getContentType() {
    return 'movie';
  }

  getTrailerLink() {
    return this.state.content.link;
  }

  getItemListTitle() {
    return 'RELACIONADO';
  }

  getReleaseYear() {
    return this.state.content.release === null ? '[Fecha lanzamiento]' : this.state.content.release;
  }

  renderItemList() {
    return this.state.content.relateds.map((item, i) => (
      <li className="list-group-item" key={i}>
        <h4 className="mb-1">{item.title}</h4>
        <p className="mb-1">{item.release.substring(0, 4)}</p>
      </li>
    ));
  }

  renderDetails() {
    return `${this.getClassification()} | ${this.getCategories()} | ${this.getReleaseYear()}`;
  }
}
