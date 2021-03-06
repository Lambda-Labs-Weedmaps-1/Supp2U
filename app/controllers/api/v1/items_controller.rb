module Api
	module V1
		class ItemsController < ApplicationController
			def index
				@items = Menu.find(params[:menu_id]).items

				render json: @items.with_attached_image
			end

			def create
				@item = Item.new(item_params)

				if @item.save
					render json: @item, status: :created
				else
					render json: @item.errors, status: :unprocessable_entity
				end
			end

			def show
				@item = Item.find(params[:id])

				render json: @item
			end

			def update
				@item = Item.find(params[:id])

				@upload = ImageUploader.new(@item, item_params)

				if @upload.call
					render json: @upload, status: :ok
				else
					render json: @upload.errors, status: :unprocessable_entity
				end
			end

			def destroy
				@item = Item.find(params[:id])

				if @item.destroy
					render json: {
							message: 'Your item has successfully been terminated.'
					       }
				else
					render json: {
							message: 'Could not find the item you are trying to remove.'
					       }
				end
			end

			private

			def item_params
				params.permit(
					:menu_id,
					:item_name,
					:price,
					:inventory,
					:category,
					:description,
					:cals,
					:image
				)
			end
		end
	end
end
