module Api
	module V1
		class RestaurantsController < ApplicationController
			def index
				@restaurants, @errors = Eatstreet::Restaurants.search

				render json: restaurants
			end
		end
	end
end

=begin
Started GET "/api/v1/restaurants" for ::1 at 2019-09-01 00:58:14 -0400
Processing by Api::V1::RestaurantsController#index as HTML
Completed 500 Internal Server Error in 164ms (ActiveRecord: 0.0ms)


  
NameError (uninitialized constant Eatstreet::Restaurants::Request):
  
app/services/eatstreet/restaurants.rb:9:in `search'
app/controllers/api/v1/restaurants_controller.rb:5:in `index'
=end
