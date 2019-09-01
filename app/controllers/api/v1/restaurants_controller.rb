require 'faraday'
require 'json'

module Api
	module V1
		class RestaurantsController < ApplicationController
			include Faraday

			def index
				# Todo place faraday code here to test requests
				#* refactor to follow convention once it's working.
				#? https://www.mobomo.com/2012/03/faraday-one-http-client-to-rule-them-all/

				# build connection
				conn = Faraday.new(url: 'https://eatstreet.com/publicapi/v1')
				# headers: {
				# 	# 'X-Mashape-key' => '86e96159e57f9343'
				# 	'Content-Type' => 'application/json'
				# }

				resp =
					conn.get('restaurant/search') do |req|
						req.headers['Content-Type'] = 'application/json'
						req.headers['X-Access-Token'] = ENV['EATSTREET_KEY']
						req.params['street-address'] = '80012'
						req.params['method'] = 'both'
						# req.body = { query: 'burlingame_restaurants' }.to_json
					end

				# address = resp.body.address
				# restaurants = resp.body.restaurants

				data = JSON.parse(resp.body)

				render json: data['restaurants'][1]
				# @restaurants, @errors = Eatstreet::Restaurants.search

				# render json: restaurants
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
