module Api
    module V1
      class CustomersController < ApplicationController

        def index
          @customers = Customer.all

          render json: @customers
        end

        def show
          @customer = Customer.find(params[:user_id])

          render json: @customer
        end

        def create
          @customer = Customer.new(customer_params)

          if @customer.save
              render json: @customer, status: :created
          else
              render json: @customer.errors, status: :unprocessable_entity
          end
        end

        def update
          @customer = Customer.find(params[:user_id])

          if @customer.save
            render json: @customer, status: :created
          else
            render json: @customer.errors, status: :unprocessable_entity
          end
        end

        def destroy
          @customer = Customer.find(params[:user_id])

          if @customer.destroy
            render json: { message: "Your customer has successfully been terminated." } 
          else
            render json: { message: "Could not find the customer you are trying to remove." }
          end
        end

        private

        def customer_params
            params.permit(:user_id)
        end

      end
    end
  end