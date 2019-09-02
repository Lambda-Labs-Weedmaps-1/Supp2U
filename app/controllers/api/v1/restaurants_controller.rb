module Api
	module V1
		class RestaurantsController < ApplicationController
			def index
				@restaurants = Eatstreet::Restaurants.restaurants

				render json: @restaurants
			end
		end
	end
end
