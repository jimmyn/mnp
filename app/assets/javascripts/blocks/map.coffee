evil.block "@@map",
  init: ->
    @map = new GMaps
      el: '#map-frame'
      zoomControl: true
      zoomControlOpt:
        style: "SMALL"
      panControl: false
      scrollwheel: false
      lat: 59.8515172
      lng: 30.1933482
    @map.addMarker
      lat: 59.8515172
      lng: 30.1933482
