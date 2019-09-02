require 'faraday'
require 'json'

#* Restaurants will be stored, and individual restaurant can be accessed via it's apiKey property.
#* Front-end user selects 'business' and using the apiKey associated with that 'business' the user will be routed to the corresponding view with all the detailed info that lives in the db. Restaurant details can populate the restaurant profile pages
module Eatstreet
	class Restaurant < Base
		attr_accessor :apiKey,
		              :logoUrl,
		              :name,
		              :streetAddress,
		              :city,
		              :state,
		              :zip,
		              :foodTypes,
		              :phone,
		              :latitude,
		              :longitude,
		              :minFreeDelivery,
		              :taxRate,
		              :acceptsCash,
		              :acceptsCard,
		              :offersPickup,
		              :offersDelivery,
		              :isTestRestaurant,
		              :minWaitTime,
		              :maxWaitTime,
		              :open,
		              :url,
		              :hours,
		              :timezone

		def self.find(apiKey)
			response = Request.get("restaurant/#{apiKey}")
			Restaurant.new(response)
		end

		def initialize(args = {})
			super(args)
			self.foodTypes = parse_food_types(args)
			self.hours = parse_hours(args)
		end

		def parse_food_types(args = {})
			args.fetch('foodTypes', []).map { |type| FoodTypes.new(type) }
		end

		def parse_hours(args = {})
			hours = args['hours']
			# if instructions
			# 	steps = instructions.first.fetch('steps', [])
			# 	steps.map { |instruction| Instruction.new(instruction) }
			# end
		end
	end
end
