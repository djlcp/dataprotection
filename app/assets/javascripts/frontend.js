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

	// show relevant note for article

	$( ".gdprRecitalText, .guidanceNoteText" ).hide();

	$( "#gdprArticle" ).click(function() {
		$( ".gdprArticleText" ).show();
	  	$( ".gdprRecitalText, .guidanceNoteText" ).hide();
	});

	$( "#gdprRecital" ).click(function() {
		$( ".gdprRecitalText" ).show();
	  	$( ".gdprArticleText, .guidanceNoteText" ).hide();
	});

	$( "#guidanceNote" ).click(function() {
		$( ".guidanceNoteText" ).show();
	  	$( ".gdprArticleText, .gdprRecitalText" ).hide();
	});


	// hamburger

	$(".hamburger").click(function() {
		$(".mobileNav").toggle();
	})


	// law article selection

	$('.lawSelection[data-article-content]').click(function() {
		$(this).data('article-content').css("background-color", "yellow");
	})


});