$( document ).on 'turbolinks:load', ->
  $('.js-group-categories').hide()

  $('.js-group-title').on 'click', ->
    $(this).find('.fas').toggleClass('fa-rotate')
    $(this).next().slideToggle()
