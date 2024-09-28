// app/javascript/controllers/hero_controller.js
// Uses javascript to set the background image for the hero section
// Done this way to assist with shortening the time it takes to load the page

import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.loadBackgroundImage();
  }

  loadBackgroundImage() {
    const backgroundImageUrl = 'https://truckerjobs.s3.us-east-2.amazonaws.com/truck_hyper_drive.jpg';
    const backgroundImage = new Image();

    backgroundImage.src = backgroundImageUrl;
    backgroundImage.onload = () => {
      this.element.style.backgroundImage = `url(${backgroundImageUrl})`;
    };
  }
}
