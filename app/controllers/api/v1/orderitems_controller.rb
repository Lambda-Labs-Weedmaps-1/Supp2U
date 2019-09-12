module Api
    module V1
      class OrderitemsController < ApplicationController

        def index

          if params[:order_id].present?
            order_items = Order.find(params[:order_id]).order_items
          else
            order_items = OrderItem.all
          end
          render json: order_items.with_attached_image
        end

        # /orders/:order_id/orderitems
        def create
          order_item = OrderItem.new(order_item_params)

          if order_item.save
            render json: order_item, status: :created
          else
            render json: order_item.errors, status: :unprocessable_entity
          end
        end

        def show 
          order_item = OrderItem.find(params[:id])

          render json: order_item
        end

        def update
          order_item = OrderItem.find(params[:id])

          @upload = ImageUploader.new(order_item, order_item_params)

          if @upload.call
            render json: @upload, status: :ok
          else
            render json: @upload.errors, status: :unprocessable_entity
          end
        end

        def destroy
          order_item = OrderItem.find(params[:id])

          if order_item.destroy
              render json: { message: "Your item has successfully been terminated." } 
          else
              render json: { message: "Could not find the item you are trying to remove." }
          end
        end

        private
        def order_item_params
          params.permit(:order_id, :item_name, :price, :inventory, :image)
        end

      end
    end
end

 