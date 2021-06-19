// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('../jquery.raty.js')

require("chartkick")
require("chart.js")
require("../controllers/maps_controller")
//var jQuery = require("jquery");

//= require gritter
//= require jquery
//= require gmaps/google
//= require underscore


global.$ = global.jQuery = jQuery;
window.$ = window.jquery = jQuery;





import "../stylesheets/application.scss"
require('admin-lte')

import "admin-lte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min"

//import "admin-lte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"
import "admin-lte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"
import "admin-lte/plugins/icheck-bootstrap/icheck-bootstrap.min.css"
import "admin-lte/plugins/jqvmap/jqvmap.min.css"
import "admin-lte/dist/css/adminlte.min.css"
import "admin-lte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"
import "admin-lte/plugins/daterangepicker/daterangepicker.css"
import "admin-lte/plugins/summernote/summernote-bs4.css"

import "admin-lte/plugins/fontawesome-free/css/all.min.css"
//import  "admin-lte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"
import "admin-lte/dist/css/adminlte.min.css"
import "admin-lte/plugins/jquery/jquery.min.js"
import "admin-lte/plugins/jquery-ui/jquery-ui.min.js"
import "admin-lte/plugins/bootstrap/js/bootstrap.bundle.min.js"
import "admin-lte/plugins/chart.js/Chart.min.js"
import "admin-lte/plugins/sparklines/sparkline.js"
import "admin-lte/plugins/jqvmap/jquery.vmap.min.js"
import "admin-lte/plugins/jqvmap/maps/jquery.vmap.usa.js"
import "admin-lte/plugins/jquery-knob/jquery.knob.min.js"
//import "admin-lte/plugins/moment/moment.min.js"
import "admin-lte/plugins/daterangepicker/daterangepicker.js"
//import "admin-lte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"

import "admin-lte/plugins/summernote/summernote-bs4.min.js"


import "admin-lte/dist/js/adminlte.js"

import "chartkick/chart.js"
require("chartkick")
require("chart.js")
//font part
import "@fortawesome/fontawesome-free/js/all.min"
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


import "controllers"
window.dispatchMapsEvent = function (...args) {
    const event = document.createEvent("Events")
    event.initEvent("google-maps-callback", true, true)
    event.args = args
    window.dispatchEvent(event)
}