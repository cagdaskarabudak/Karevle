import './bootstrap';
import 'jquery-ui/dist/jquery-ui';
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle';
window.bootstrap = bootstrap;
import 'alpagu-icons/js/all';

import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';
window.Swiper = Swiper;

import MainMethods from './main';
window.mainmethods = new MainMethods();

import './navbar';
import './profile';

document.addEventListener('DOMContentLoaded', function(){
    let loadingScreen = document.querySelector('.loading-screen');
    $(loadingScreen).hide();
});

/*document.addEventListener('contextmenu', (e) => {
    e.preventDefault();
});*/

import './filter-card';
import './product_card';
import './search';
import './search-md';
import './addresses';
import './shopping_cart';