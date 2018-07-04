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
		$( ".gdprArticleText" ).toggle();
	  	// $( ".gdprRecitalText, .guidanceNoteText" ).hide();
	  	// $( ".gdprRecital, .guidanceNote" ).removeClass('selectedNoteHeader');
	  	$(this).toggleClass('selectedNoteHeader');
	});

	$( ".gdprRecital" ).click(function() {
		$( ".gdprRecitalText" ).toggle();
	  	// $( ".gdprArticleText, .guidanceNoteText" ).hide();
	  	// $( ".gdprArticle, .guidanceNote" ).removeClass('selectedNoteHeader');
	  	$(this).toggleClass('selectedNoteHeader');
	});

	$( ".guidanceNote" ).click(function() {
		$( ".guidanceNoteText" ).toggle();
	  	// $( ".gdprArticleText, .gdprRecitalText" ).hide();
	  	// $( ".gdprRecital, .gdprArticle" ).removeClass('selectedNoteHeader');
	  	$(this).toggleClass('selectedNoteHeader');
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

	// Infographics

	$( ".infographic" ).click(function() {
		$(".infographic").not(this).hide();
		$( this ).css({"max-width": "900px",
						"width": "100%", 
						"max-height": "100%",
						"max-height": "550px",
						"margin": "0px auto"});
		$('.close').show();
		$(this).parent('.infographics').addClass('infographicsModal');
	});

	$('.close').click(function() {
		$(".infographic").show();
		$('.infographic').css({ "max-width": "250px", "max-height": "160px"});
		$('.infographics').removeClass('infographicsModal');
		$('.close').hide();
	})

});
