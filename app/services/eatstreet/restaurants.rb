#? https://wilburhimself.github.io/using-service-objects-in-ruby-on-rails/
#? need a way to replace apiKey keys (48 char length string)
#* SecureRandom.hex(24)
#* look into .uuid too
require 'faraday'
require 'json'

module Eatstreet
	class Restaurants
		attr_accessor :address, :restaurants

		def self.restaurants
			conn = Faraday.new(url: 'https://eatstreet.com/publicapi/v1')
			response =
				conn.get('restaurant/search') do |req|
					req.headers['Content-Type'] = 'application/json'
					req.headers['X-Access-Token'] = ENV['EATSTREET_KEY']
					req.params['street-address'] = '80012'
					req.params['method'] = 'both'
					req.params['pickup-radius'] = '30'
				end

			#! Error handling what if response fails???
			#! Look into caching strategies
			#! Test the feature => what does the user expect when they take this action
			#? How are you going to save restaurants into db efficiently???
			# parse json response
			#* rails method: with_indifferent_access allows for access via symbols
			data = JSON.parse(response.body).with_indifferent_access
			# access array of restaurant objects
			# puts data[:restaurants][2]
			data[:restaurants]
		end
	end
end
