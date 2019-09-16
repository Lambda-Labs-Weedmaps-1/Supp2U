module Api
	module V1
		class SearchController < ApplicationController
			def search
				# ! Error checking some restaurant names will have numbers, but no symbols in query param
				businesses = Business.search_by_theme(params[:query])
				items = Business.search_menu_for_item(params[:query])
				results = [businesses, items]
				
				# render json: items
				#! Todo ERROR CHECKING AND TESTS
				render json: results.to_json
			end
		
		end
	end
end
