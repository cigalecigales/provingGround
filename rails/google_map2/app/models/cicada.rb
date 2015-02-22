class Cicada < ActiveRecord::Base
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode
end
