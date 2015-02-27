evil.block "@@products_slider",
  init: ->
    @block.bxSlider
      slideWidth: 419
      minSlides: 4
      maxSlides: 4
      moveSlides: 4
      slideMargin: 10
      infiniteLoop: true
      controls: false
      slideSelector: 'figure'
      auto: true
      autoHover: true
