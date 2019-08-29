class Request
	# using << self so I don't have to prefix all the methods with self
	class << self
		def where(resource_path, query = {}, options = {})
			response, status = get_json(resource_path, query)
			status == 200 ? response : errors(response)
		end

		def get(id); end

		def errors(response); end

		def get_json(root_path, query = {}); end

		def api
			Connection.api
		end
	end
end
