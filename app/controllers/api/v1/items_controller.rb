module Api
    module V1
      class ItemsController < ApplicationController

        def index
          @items = Menu.find(params[:menu_id]).items
  
          render json: @items
        end

        def create
          @item = Item.new(item_params)

          if @item.save
            render json: @item, status: :created
          else
            render json: @item.errors, status: unprocessable_identity
          end
        end

        private
        def item_params
          params.permit(:menu_id, :item_name, :price, :category)
        end

      end
    end
  end