module Api
    module V1

        class CartsController < ApplicationController

            def index
                @cart = Customer.find(params[:customer_id]).carts
                @carts = Cart.all

                if params[:customer_id].present?
                    render json: @cart.find_by(active:true)
                else
                    render json: @carts
                end

            end


            def create
                @cartthere = Customer.find(params[:customer_id]).carts.find_by(active: true)

                if @cartthere
                    render json: @cartthere, status: :ok
                else
                    @createcart = Cart.new(cart_params)

                    if @createcart.save
                        render json: @createcart, status: :created
                    else
                        render json: @createcart.errors, status: :unprocessable_entity
                    end
                end

            end


            def show 

                @cartnum = Cart.find(params["id"])

                render json: @cartnum
            end

            def add

                @cart = Cart.find(params[:id])
                puts(@cart.item_numbers)
                
                @cart.item_numbers.push(params[:item_number])
                # @cart.item_numbers_will_change!
                # @cart.save!

                puts(@cart.inspect)
                if @cart.save!
                    render json: @cart, status: :created
                else
                    render json: @cart.errors, status: :unprocessable_entity
                end

            end


            def itemfetch
                cart = Cart.find(params[:id])
                #assumes coming in as an array
                itemlot = cart.item_numbers # looking at array column on carts table
                arrayofitems = []
                
                itemlot.each do |item_id|
                    item = Item.find(item_id)
                    arrayofitems << item
                end

                if arrayofitems.length > 0
                    render json: arrayofitems, status: :ok
                else
                    render json: itemlot, status: :not_acceptable
                end
            end

            def removeitem
                cart = Cart.find(params[:id])
                items = cart.item_numbers
                items.delete_at(items.index(params[:item_number]))

                if cart.save!
                    render json: cart, status: :ok
                else
                    render json: cart.errors, status: :not_acceptable
                end
            end

            def destroy
                @cart = Cart.find(params[:id])

                # destroy doesn't 'save' because instance variable, just like .save after creation
                # @cart.destroy

				if @cart.delete
					render json: { message: 'Your cart has successfully been deleted.'}, status: :ok
				else
					render json: { message: 'Could not find the cart you are trying to remove.'}, status: :unprocessable_entity
				end
            end


            private
            def cart_params
                params.permit(:customer_id, :active, :business_id, :quantity, :item_numbers)

            end

        end

    end
end
