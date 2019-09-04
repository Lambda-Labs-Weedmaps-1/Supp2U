module Api
    module V1
      class CustomersController < ApplicationController

        def index
          if params[:user_id].present?
              @customers = Customer.where(user_id: params[:user_id])
          else
              @customers = Customer.all.with_attached_image
          end
          render json: @customers
        end

        def show
          @customer = Customer.find(params[:user_id])

          render json: @customer.with_attached_image
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

          # if @customer.update(customer_params)
          #   render json: @customer, status: :created
          # else
          #   render json: @customer.errors, status: :unprocessable_entity
          # end

          if ImageUploadService.new(@customer, customer_params).call
            render json: @customer, status: :ok
          else
            render json: @customers.errors, status: :unprocessable_entity
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
            params.permit(:user_id, :custname, :image)
        end

      end
    end
  end