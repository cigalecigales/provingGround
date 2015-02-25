window.onload = ->
	window.map = new GMaps
		div: '#map'
		lat: 35.672370
		lng: 139.736538
		zoom: 6
	initialize()

initialize = ->
	$('#geo_form').submit (e) ->
		e.preventDefault()
		GMaps.geocode
			address: $('#address').val().trim()
			callback: (results, status) ->
				if status == 'OK'
					latlng = results[0].geometry.location
					map.setCenter(latlng.lat(), latlng.lng())
					map.addMarker
						lat: latlng.lat()
						lng: latlng.lng()
