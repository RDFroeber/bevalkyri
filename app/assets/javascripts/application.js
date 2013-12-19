// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require backbone
//= require_tree ./backbone/app
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./backbone/routers

$(function(){
  Bv.init();
});


$("div.tile").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y").split("-")[1]) * 32;
  var distanceFromLeft = ($(this).attr("data-x").split("-")[0]) * 32;

  $(this).css("top", distanceFromTop);
  $(this).css("left", distanceFromLeft);
});

$("div.castle").each(function(){
  var distanceFromTop = (12 - $(this).attr("data-y")) * 32 - 10;
  var distanceFromLeft = ($(this).attr("data-x") * 32) - 10;
  
  $(this).css("top", distanceFromTop);
  $(this).css("left", distanceFromLeft);
});