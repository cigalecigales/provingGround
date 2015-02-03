require 'flickraw'

FlickRaw.api_key = ''
FlickRaw.shared_secret = ''

tag = "cicada"

images = flickr.photos.search(tags: tag, sort: "relevance", per_page: 1)
images.each do |image|
	url = FlickRaw.url image;
	puts url
end
