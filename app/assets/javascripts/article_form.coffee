$( document ).on 'turbolinks:load', ->
  $('.js-article-fields').hide()
  $('.js-article-type-select').each ->
    if $(this).is(':checked')
      $('.js-article-fields').slideDown()

  $('.js-article-type-select').on 'change', ->
    if $(this).data('value') == 'article' && $(this).is(':checked')
      $('.js-article-fields').slideDown()
    else
      $('.js-article-fields').slideUp()

