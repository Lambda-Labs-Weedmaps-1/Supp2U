module Api
	module V1
		class SearchController < ApplicationController
			def search
			
				businesses = Business.search_by_theme(params[:query]).ids
        items = Business.search_menu_for_item(params[:query]).ids
        
        results = Business.where(id: businesses + items).distinct
      
        render json: results
        
			end
		end
	end
end
