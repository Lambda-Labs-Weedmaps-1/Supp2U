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
                    render json: @createcart, status: :created
                else
                    render json: @createcart.errors, status: :unprocessable_entity
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
                @cart = Cart.find(params[:id])

                #assumes coming in as an array
                @itemlot = @cart.item_numbers

                @arrayofitems = ["Array of Cart Items"]
                # @arrayofitems = Array.new(@itemlot.length, "null")
                puts("I AM HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
                puts(@arrayofitems)

                @itemlot.each { |a| 
                    @items = Item.where(id: a)
                    puts(@items.inspect)
                    @arrayofitems.push(@items)
                    # @arrayofitems.unshift(@items)
                    # @arrayofitems.delete("null")

                    puts("I GOT HERE NOW MEOWWSWWWwwwwwwwwwwwwwww")
                    puts(@arrayofitems)

                }

                # @arrayofitems.unshift()

                if @arrayofitems.length > 0
                    render json: @arrayofitems, status: :ok
                else
                    render json: @itemlot, status: :not_acceptable
                end

                

            end


            private
            def cart_params
                params.permit(:customer_id, :business_id, :quantity, :item_numbers)

            end

        end

    end
end
