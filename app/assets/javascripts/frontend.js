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

	$( ".gdprArticle" ).click(function() {
		$( ".gdprArticleText" ).show();
	  	$( ".gdprRecitalText, .guidanceNoteText" ).hide();
	  	$( ".gdprRecital, .guidanceNote" ).removeClass('selectedNoteHeader');
	  	$(this).addClass('selectedNoteHeader');
	});

	$( ".gdprRecital" ).click(function() {
		$( ".gdprRecitalText" ).show();
	  	$( ".gdprArticleText, .guidanceNoteText" ).hide();
	  	$( ".gdprArticle, .guidanceNote" ).removeClass('selectedNoteHeader');
	  	$(this).addClass('selectedNoteHeader');
	});

	$( ".guidanceNote" ).click(function() {
		$( ".guidanceNoteText" ).show();
	  	$( ".gdprArticleText, .gdprRecitalText" ).hide();
	  	$( ".gdprRecital, .gdprArticle" ).removeClass('selectedNoteHeader');
	  	$(this).addClass('selectedNoteHeader');
	});


	// hamburger

	$(".hamburger").click(function() {
		$(".mobileNav").toggle();
	});


	// law article selection

	$('.lawSelection').click(function() {
    	var articleTitleElement = $(this).attr('data-article');
    	var articleElement = $('.articleSectionHide').attr('data-article');
    	$(this).addClass('active');
    	$('.welcomeSection').addClass('notActive');
    	$('.lawSelection[data-article != '+articleTitleElement+']').removeClass('active');
    	$('.articleSectionHide[data-article = '+articleTitleElement+']').addClass('active');
		$('.articleSectionHide[data-article != '+articleTitleElement+']').removeClass('active');
	});


});
