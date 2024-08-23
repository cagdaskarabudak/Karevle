import axios from 'axios';
import jQuery from 'jquery';
window.axios = axios;
window.$ = window.jQuery = jQuery;
import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';
window.Swiper = Swiper;
import '@rateyo/jquery/lib/es/jquery.rateyo';
import '@rateyo/jquery/lib/es/jquery.rateyo.css';

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
