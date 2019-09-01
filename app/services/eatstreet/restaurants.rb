module Eatstreet
	class Restaurants < Base
		include Eatstreet::Request
		attr_accessor :address, :restaurants

		def self.search
			resp =
				Request.get('restaurant/search') do |req|
					req.params['street-address'] = '94010'
					req.params['method'] = 'both'
					req.body = { query: 'burlingame_restaurants' }.to_json
				end

			# Restaurants.new(
			# 	resp.body.restaurants.map { |restaurant| restaurant[:name] }
			# )
			burlingame_names =
				resp.body.restaurants.map { |restaurant| restaurant[:name] }
		end
	end
end
