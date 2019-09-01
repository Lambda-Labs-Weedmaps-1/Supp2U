module Eatstreet
	class Restaurant < Base
		attr_accessor :name, :streetAddress, :city, :foodTypes, :offersDelivery

		# get request with apiKey or id
		# https://devdocs.io/ruby~2.6/hash#method-i-fetch
	end
end
