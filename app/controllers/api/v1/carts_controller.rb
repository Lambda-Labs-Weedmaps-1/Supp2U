module Api
    module V1

        class CartsController < ApplicationController

            def index
                @cart = Customer.find(params[:customer_id]).cart

                render json: @cart
            end


            def create
                # @cartitem = params[:id]
                # @newItem = Menu.find(item = cartitem)

                @createcart = Cart.new(cart_params)

                if @createcart.save
                    render json: @createcart
                else
                    render json: @createcart.errors, status: :unprocessable_entity
                end

            end


            def show 

                @cartnum = Cart.find(params["id"])

                render json: @cartnum
            end


            private
            def cart_params
                params.permit(:customer_id, :business_id, :quantity, :item_numbers)

            end

        end

    end
end
