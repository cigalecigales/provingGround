window.onload = ->
	window.map = new GMaps
		div: '#map'
		lat: 35.672370
		lng: 139.736538
		zoom: 6
		click: (e) ->
			index = map.markers.length
			if index == 0
				lat = e.latLng.lat()
				lng = e.latLng.lng()
				map.setCenter(lat, lng)
				map.addMarker
					lat: lat
					lng: lng
			else
				map.markers[0].setPosition(e.latLng)
				map.setCenter(e.latLng.lat(), e.latLng.lng())
	search_setting()

search_setting = ->
	$('#geo_form').submit (e) ->
		e.preventDefault()
		GMaps.geocode
			address: $('#address').val().trim()
			callback: (results, status) ->
				if status == 'OK'
					index = map.markers.length
					if index == 0
						latlng = results[0].geometry.location
						map.setCenter(latlng.lat(), latlng.lng())
						map.addMarker
							lat: latlng.lat()
							lng: latlng.lng()
					else
						latlng = results[0].geometry.location
						map.markers[0].setPosition(latlng)
						map.setCenter(latlng.lat(), latlng.lng())

