module Api
    module V1
        class OrdersController < ApplicationController

            def index
                if params[:customer_id].present?
                    @find_orders = Order.where(customer_id: params[:customer_id]).includes([:items])
                elsif params[:business_id].present?
                    @find_orders = Order.where(business_id: params[:business_id])
                else
                    @find_orders = Order.all
                end
                # Formatting the orders to include all of their items via join table
                @orders = @find_orders.map { |order| format_order(order) }
                render json: @orders
            end
            
            def show
                @order = Order.find(params[:id])
                render json: @order
            end

            # create is making a pending order. The order still needs to be populated with items using the additem action
            def create
                @order = Order.new(customer_id: params[:customer_id], business_id: params[:business_id], status: :pending)

                if @order.save
                    render json: @order, status: :created
                else
                    render json: @order.errors, status: :unprocessable_entity
                end
            end

            # additem is creating the join table.
            def additem
                @item = OrderItem.new(order_id: params[:id], item_id: params[:item_id])

                if @item.save
                    render json: @item, status: :created
                else
                    render json: @item.errors, status: :unprocessable_entity
                end
            end

            # this will change the status of the order from pending to shipped.
            def ship
            end

            private
            def format_order(order)
                # this is a guard clause to prevent `orders` calls until we write the orders association
                return order unless order.respond_to?(:items)
        
                {
                  id: order.id,
                  status: order.status,
                  business_id: order.business_id,
                  customer_id: order.customer_id,
                  items: order.items.map do |item|
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