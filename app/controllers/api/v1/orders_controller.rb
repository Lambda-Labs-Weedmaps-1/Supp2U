module Api
    module V1
        class OrdersController < ApplicationController

            def index
                if params[:customer_id].present?
                    find_orders = Order.where(customer_id: params[:customer_id]).includes([:items])
                elsif params[:business_id].present?
                    find_orders = Order.where(business_id: params[:business_id])
                else
                    find_orders = Order.all
                end
                # Formatting the orders to include all of their items via join table
                orders = find_orders.map { |order| format_order(order) }
                render json: orders
            end
            
            def show
                find_order = Order.find(params[:id])
                
                render json: format_order(find_order)
            end

            # customers/customer_id/orders
            def create

                order = Order.create(customer_id: params[:customer_id], business_id: params[:business_id], status: :pending)
                # cart = Customer.find(params[:customer_id]).cart
                
                # cart.item_numbers.each do |item_id|
                #     order_holder = OrderItem.new(order_id: Nil, item_id: item_id)
                #     order_holder.save
                #     puts order_holder.inspect
                # end

                # puts " order is hereeeeeeeeeee #{order.inspect}"

                if order.save
                    render json: order, status: :created
                else
                    render json: order.errors, status: :unprocessable_entity
                end
            end

            # this will change the status of the order from pending to shipped.
            # orders/:id/ship
            def ship
                order = Order.find(params[:id])
                order_processor = OrderProcessor.new(order)

                if order.status == "shipped"
                    # can't ship an order that has already been shipped
                    render json: {message: "you're order has already been shipped.", order: order}, status: :not_acceptable
                elsif order_processor.ship
                    # order gets shipped
                    render json: order, status: :ok
                else
                    render json: order.errors, status: :unprocessable_entity
                end
            end

            private
            def format_order(order)
                # this is a guard clause to prevent `orders` calls until we write the orders association
                return order unless order.respond_to?(:order_items)
        
                {
                  id: order.id,
                  status: order.status,
                  business_id: order.business_id,
                  customer_id: order.customer_id,
                  items: order.order_items.map do |item|
                    {
                      id: item.id,
                      name: item.item_name,
                      price: item.price
                    }
                  end
                }
              end
        end
    end
end