// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require_tree .
<<<<<<< HEAD



$( document ).ready(function() {

  $(".1").hide();
  $(".2").hide();
  $(".3").hide();
  $(".4").hide();

    $(".btn1").click(function(){
        $(".1").slideDown();
        $(".2").slideUp();
        $(".3").slideUp();
        $(".4").slideUp();
    });
    $(".btn2").click(function(){
        $(".2").slideDown();
        $(".1").slideUp();
        $(".3").slideUp();
        $(".4").slideUp();

    });
    $(".btn3").click(function(){
        $(".3").slideDown();
        $(".1").slideUp();
        $(".2").slideUp();
        $(".4").slideUp();

    });
    $(".btn4").click(function(){
        $(".4").slideDown();
        $(".1").slideUp();
        $(".2").slideUp();
        $(".3").slideUp();



    });


  });
=======
>>>>>>> cd4db956bae148c02102d7ecaec72b4698a18791
