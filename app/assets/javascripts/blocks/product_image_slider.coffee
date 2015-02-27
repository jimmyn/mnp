evil.block "@@product_image_slider",
  init: ->
    @slider.bxSlider
      pagerCustom: ".pager"
      mode: "fade"
      controls: false
      infiniteLoop: false

    if @pager

      @pager.bxSlider
        slideWidth: 137
        minSlides: 3
        maxSlides: 3
        moveSlides: 1
        slideMargin: 8
        pager: false
        controls: @slider.getSlideCount() > 3
        infiniteLoop: false
        nextText: ""
        prevText: ""
        onSliderLoad: =>
          @pager.css 'opacity', 1

    $(".bx-prev").on "click", @slider.goToPrevSlide
    $(".bx-next").on "click", @slider.goToNextSlide