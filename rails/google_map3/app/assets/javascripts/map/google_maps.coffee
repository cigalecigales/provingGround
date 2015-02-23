initialize = ->
  myOptions =
    center: new google.maps.LatLng -34.397, 150.644
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map $('#map')[0], myOptions
  
loadScript = ->
  script = document.createElement 'script'
  script.type = 'text/javascript'
  script.src = 'http://maps.googleapis.com/maps/api/js?key=AIzaSyB7Szc8t8HNN1fa2jlA_z2Yxaf_F2r_bT0&sensor=false&libraries=drawing&callback=initialize'
  document.body.appendChild script