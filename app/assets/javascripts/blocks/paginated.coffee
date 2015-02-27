evil.block "@@paginated",
  init: ->
    @path = @block.data('path')

  'click on @load_more': (e) ->
    e.preventDefault()
    @loadMore()

  loadMore: ->
    currentPage = @load_more.data('currentPage') || 1
    nextPage    = currentPage + 1
    params = $.query.set 'page', nextPage
    $.get "#{@path}.js#{params}"
    @load_more.data 'currentPage', nextPage