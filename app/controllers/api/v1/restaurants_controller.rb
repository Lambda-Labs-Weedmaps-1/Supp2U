require 'faraday'
require 'json'

module Api
	module V1
		class RestaurantsController < ApplicationController
			def index
				# build connection
				conn = Faraday.new(url: 'https://eatstreet.com/publicapi/v1')

				# assign request object to resp variable
				resp =
					conn.get('restaurant/search') do |req|
						req.headers['Content-Type'] = 'application/json'
						req.headers['X-Access-Token'] = ENV['EATSTREET_KEY']
						req.params['street-address'] = '80012'
						req.params['method'] = 'both'
					end

				# parse the response body and save as data variable
				data = JSON.parse(resp.body)

				# rendering out 2nd restaurant from dataset
				render json: data['restaurants'][5]
			end
		end
	end
end
