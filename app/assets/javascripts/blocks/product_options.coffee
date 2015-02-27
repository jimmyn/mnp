evil.block "@@product_options",
  init: ->
    @mainPrice = +@total_price.html()
    @n = @quantity.val()
    @option_ids = []

  'change on @option': (e)->
    el = $(e.target)
    checked = el.is(':checked')
    price = el.data('price')
    price = if checked then price else -price
    el.closest('tr').toggleClass('active')
    @mainPrice += price
    if checked
      @option_ids.push el.val()
    else
      @option_ids.splice $.inArray(el.val(), @option_ids), 1

    @options.val @option_ids
    @updatePrice +@total_price.html() + price * @n

  'change on @quantity': (e)->
    el = $(e.target)
    @n = el.val()
    @updatePrice @mainPrice * @n
    @quantity.val @n

  'change on @total_price': (e) ->
    el = $(e.target)
    consle.log el.val()

  updatePrice: (price) ->
    @total_price.html price
    @price_input.val price

