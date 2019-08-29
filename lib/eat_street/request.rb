class Request
	# using << self so I don't have to prefix all the methods with self
	# all class-level methods Request.thing()...
	# makes actual requests to EatStreet API
	class << self
		def where(resource_path, query = {}, options = {})
			response, status = get_json(resource_path, query)
			status == 200 ? response : errors(response)
		end

		def get(id)
			response, status = get_json(id)
			status == 200 ? response : errors(response)
		end

		def errors(response)
			error = {
				errors: { status: response['status'], message: response['message'] }
			}
			response.merge(error)
		end

		def get_json(root_path, query = {})
			query_string = query.map { |k, v| "#{k}=#{v}" }.join('&')
			path = query.empty? ? root_path : "#{root_path}?#{query_string}"
			response = api.get(path)
			[JSON.parse(response.body), response.status]
		end

		def api
			Connection.api
		end
	end
end
