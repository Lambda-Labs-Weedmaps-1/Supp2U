module Eatstreet
	class Restaurants < Base
		attr_accessor :name, :streetAddress, :city, :foodTypes, :offersDelivery

		# MAX_LIMIT = 10

		# example query
		# https://api.spotify.com/v1/search?type=artist&q=tycho
		def self.search(query = {}, options)
			response =
				Request.where(
					'restaurant/search',
					query = {
						latitude: '39.7392358', longitude: '-104.990251', method: 'both'
					}
				)
			denver_restaurant_names =
				response.body.restaurants.map { |restaurant| restaurant[:name] }
		end
	end
end
