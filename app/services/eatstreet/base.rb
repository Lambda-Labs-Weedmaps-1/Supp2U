module Eatstreet
	class Base
		attr_accessor :errors

		def initialize(args = {})
			args.each do |name, value|
				# ? .underscore => HelloWorld becomes hello_world
				attr_name =
					name.to_s.underscore
				send("#{attr_name}=", value) if respond_to?("#{attr_name}")
			end
		end
	end
end
