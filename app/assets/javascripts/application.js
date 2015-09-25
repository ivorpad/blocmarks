// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

// http://stackoverflow.com/questions/18770517/rails-4-how-to-use-document-ready-with-turbo-links
$(document).on('ready page:load', function () {
  $('.nav-tabs > li:first-child').addClass('active');
  $('.tab-pane:first-child').addClass('active');
});
