evil.block "@@price_range",
  init: ->
    @range.ionRangeSlider
      type: "double"
      step: 1000

  'click on @submit': (e) ->
    e.preventDefault()
    @price_range = @range.prop("value").split(';')
    params = $.query.set('min', @price_range[0]).set('max', @price_range[1])
    window.location = '/products' + params

