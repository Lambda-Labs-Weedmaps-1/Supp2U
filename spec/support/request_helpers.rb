module Requests
	module JsonHelpers
		def json
			JSON.parse(response.body)
		end
		def serialize
			JSON.parse(serialization.to_json)
		end
	end
end
