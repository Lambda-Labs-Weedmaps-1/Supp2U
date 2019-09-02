module Api
	module V1
		class RestaurantController < ApplicationController
			def show
				@restaurant =
					Eatstreet::Restaurant.find(
						'90fd4587554469b1f15b4f2e73e76180f92045956bdd3e1c'
					)

				render json: @restaurant
			end
		end
	end
end
