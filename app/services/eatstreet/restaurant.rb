module Eatstreet
	class Restaurant < Base
		attr_accessor :name, :streetAddress, :city, :foodTypes, :offersDelivery

		# MAX_LIMIT = 10

		def self.search(query = {}, options)
			response = Request.where('restaurant/search', query)
		end
	end
end
