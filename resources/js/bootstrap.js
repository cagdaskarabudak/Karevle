
import 'bootstrap/dist/js/bootstrap.bundle';

import axios from 'axios';
window.axios = axios;
import jQuery from 'jquery';
window.$ = window.jQuery = jQuery;
import '@rateyo/jquery/lib/es/jquery.rateyo';
import '@rateyo/jquery/lib/es/jquery.rateyo.css';

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
