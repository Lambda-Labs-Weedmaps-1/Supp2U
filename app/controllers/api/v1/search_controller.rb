module Api
	module V1
		class SearchController < ApplicationController
			def search
				# some restaurant names will have numbers, but no symbols in query param
				businesses = Business.search_by_theme(params[:query])
				# error checking
				render json: businesses
			end
		end
	end
end
