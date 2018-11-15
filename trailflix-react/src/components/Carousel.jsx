import React from 'react';
import AliceCarousel from 'react-alice-carousel';
import 'react-alice-carousel/lib/alice-carousel.css';
import '../dist/css/carousel.css';
import '../dist/css/Card.css';

export default class Gallery extends React.Component {
  constructor() {
    super();
    this.responsive = {
      0: { items: 1 },
      200: { items: 2 },
      400: { items: 3 },
      600: { items: 4 },
      800: { items: 5 },
    };
  }

  galleryItems() {
    return (
      this.props.listOfCards.map((item, i) => (
        <div key={`key-${i}`} className="carouselCheto">
          {item}
        </div>
      ))
    );
  }

  render() {
    const items = this.galleryItems();

    return (
      <AliceCarousel
        items={items}
        duration={400}
        showSlideInfo
        startIndex={0}
        fadeOutAnimation
        mouseDragEnabled
        enableAutoPlay
        autoPlayDirection="rtl"
        responsive={this.responsive}
        disableAutoPlayOnAction
        onSlideChange={this.onSlideChange}
        onSlideChanged={this.onSlideChanged}
      />
    );
  }
}
