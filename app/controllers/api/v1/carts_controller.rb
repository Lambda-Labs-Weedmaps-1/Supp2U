module Api
    module V1

        class CartsController < ApplicationController

            def index
                @cart = Customer.find(params[:customer_id]).cart

                render json: @cart
            end


            def create
                @cartthere = Customer.find(params[:customer_id]).cart
                # puts('CAT CHECK !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
                # puts(@cartthere)

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
                # @cart = Cart.find(params[:id])

                # #assumes coming in as an array
                # @itemlot = @cart.item_numbers

                # @arrayofitems = ["Array of Cart Items"]
                # # @arrayofitems = Array.new(@itemlot.length, "null")
                # puts("I AM HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
                # puts(@arrayofitems)

                # @itemlot.each { |a| 
                #     @items = Item.where(id: a)
                #     puts(@items.inspect)
                #     @arrayofitems.push(@items)
                # }

                # if @arrayofitems.length > 0
                #     render json: @arrayofitems, status: :ok
                # else
                #     render json: @itemlot, status: :not_acceptable
                # end

            end


            private
            def cart_params
                params.permit(:customer_id, :business_id, :quantity, :item_numbers)

            end

        end

    end
end
