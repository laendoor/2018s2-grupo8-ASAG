import React from 'react';
import ContentView from './ContentView';


function zeroLeftPad(num, size) {
  let s = `${num}`;
  while (s.length < size) s = `0${s}`;
  return s;
}

export default class SerieView extends ContentView {
  componentDidMount() {
    super.componentDidMount();
  }

  getContentType() {
    return 'serie';
  }

  getTrailerLink() {
    return this.state.content.episodes[0].link;
  }

  getItemListTitle() {
    return 'CAPITULOS';
  }

  getReleaseYear() {
    return this.state.content.episodes === null ? '[Fecha lanzamiento]' : this.extractYear(this.state.content.episodes[0].release);
  }

  getRelease() {
    return this.state.content.episodes[0].release;
  }

  getDetails() {
    return `${this.getClassification()} | ${this.getCategories()} | ${this.getReleaseYear()}`;
  }

  renderItemList() {
    return this.state.content.episodes.map((episode, i) => (
      <li className="list-group-item" key={i}>
        <h4 className="mb-1">S{zeroLeftPad(episode.season, 2)}E{zeroLeftPad(episode.episodeNumber, 2)}</h4>
        <p className="mb-1">{episode.title}</p>
      </li>
    ));
  }
}
