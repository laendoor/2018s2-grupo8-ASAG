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
    return this.state.content.release === null ? '[Fecha lanzamiento]' : this.extractYear(this.state.content.release);
  }

  getRelease() {
    return this.state.content.release;
  }

  getDetails() {
    return `${this.getClassification()} | ${this.state.content.duration} | ${this.getCategories()} | ${this.getReleaseYear()}`;
  }

  renderItemList() {
    return this.state.content.relateds.map((item, i) => (
      <li className="list-group-item" key={i}>
        <h4 className="mb-1">{item.title}</h4>
        <p className="mb-1">{this.extractYear(item.release)}</p>
      </li>
    ));
  }
}
