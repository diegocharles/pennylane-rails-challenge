// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import React from 'react';
import ReactDOM from 'react-dom';
import Ingredients from './components/Ingredients';

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('react-app');
  if (node) {
    const name = node.getAttribute('data-name');
    ReactDOM.render(<Ingredients name={name} />, node);
  }
});
