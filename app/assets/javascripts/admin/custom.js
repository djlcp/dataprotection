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
//= require ckeditor/init
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).on('turbolinks:load', function() {
// admin pannel linking articles table

  $( ".JyAuthLaw, .JyRegLaw" ).hide();

  $( ".JyDpHeading" ).click(function() {
    $( ".JyDpLaw" ).show();
      $( ".JyAuthLaw, .JyRegLaw" ).hide();
      $( ".JyAuthHeading, .JyRegsHeading" ).removeClass('selectedNoteHeader');
      $(this).addClass('selectedNoteHeader');
  });

  $( ".JyAuthHeading" ).click(function() {
    $( ".JyAuthLaw" ).show();
      $( ".JyDpLaw, .JyRegLaw" ).hide();
      $( ".JyDpHeading, .JyRegsHeading" ).removeClass('selectedNoteHeader');
      $(this).addClass('selectedNoteHeader');
  });

  $( ".JyRegsHeading" ).click(function() {
    $( ".JyRegLaw" ).show();
      $( ".JyDpLaw, .JyAuthLaw" ).hide();
      $( ".JyAuthHeading, .JyDpHeading" ).removeClass('selectedNoteHeader');
      $(this).addClass('selectedNoteHeader');
  });

});
