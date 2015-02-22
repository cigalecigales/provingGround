json.array!(@cicadas) do |cicada|
  json.extract! cicada, :id, :title, :description, :address, :latitude, :longitude
  json.url cicada_url(cicada, format: :json)
end
