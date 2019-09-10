module Api
    module V1
        class OrdersController < ApplicationController

            def index
                if params[:customer_id].present?
                    @orders = Order.where(customer_id: params[:customer_id])
                elsif params[:business_id].present?
                    @orders = Order.where(business_id: params[:business_id])
                else
                    @orders = Order.all
                end
                render json: @orders
            end
            
            def show
                @order = Order.find(params[:id])

                render json: @order
            end

            def create
                @order = Order.new(customer_id: params[:customer_id], business_id: params[:business_id], status: :pending)

                if @order.save
                    render json: @order, status: :created
                else
                    render json: @order.errors, status: :unprocessable_entity
                end
            end
        end
    end
end