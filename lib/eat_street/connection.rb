require 'faraday'
require 'json'

class Connection
	BASE = 'https://eatstreet.com/publicapi/v1'

	def self.api
		Faraday.new(url: BASE) do |faraday|
			faraday.response :logger
			faraday.adapter Faraday.default_adapter
			faraday.headers['Content-Type'] = 'application/json'
			faraday.headers['X-Access-Token'] = ENV['EATSTREET_KEY']
		end
	end
end
