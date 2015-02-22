class MapController < ApplicationController
  def index
		@cicadas = Cicada.all
		@hash = Gmaps4rails.build_markers(@cicadas) do |cicada, marker|
			marker.lat cicada.latitude
			marker.lng cicada.longitude
			marker.infowindow cicada.description
			marker.json({ title: cicada.title })
		end
  end
end
