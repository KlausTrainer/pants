initPage = ->
  # When images fail loading, replace them with our magic transparent pixel.
  #
  $("img").error ->
    $(this).attr("src", "/images/1x1.png")

expandElement = (e) ->
  el = $(this).data('expand')
  $(el).toggleClass('expanded')
  e.preventDefault()

$(document)
  .on 'page:load', initPage
  .on 'ready', initPage
  .on 'click', 'a[data-expand]', expandElement
