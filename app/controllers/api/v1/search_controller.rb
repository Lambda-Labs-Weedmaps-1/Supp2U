module Api
	module V1
		class SearchController < ApplicationController
			def search
				businesses = Business.search_by_theme(params[:query])

				render json: businesses
			end
		end
	end
end
