import './bootstrap';
import 'jquery-ui/dist/jquery-ui';
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle';
window.bootstrap = bootstrap;
import 'alpagu-icons/js/all';

import 'zoomist/css';
import Zoomist from 'zoomist';
window.Zoomist = Zoomist;

import ShoppingCard from './shopping-card';
window.shoppingCard = new ShoppingCard();

import Favorites from './favorite';
window.favorites = new Favorites();

import MainMethods from './main';
window.mainmethods = new MainMethods();

import Filter from './filter';
window.filter = new Filter();

import Product from './dashboard-product';
window.Product = Product;