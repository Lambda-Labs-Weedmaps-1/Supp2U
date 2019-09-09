module Api
  module V1
    class CustomersController < ApplicationController

      def index
        @customers = if params[:id].present?
                       Customer.where(id: params[:id])
                     else
                       Customer.all
                     end
        render json: @customers
      end

      def show
        @customer = Customer.find(params[:id])
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
        @customer = Customer.find(params[:id])

        @upload = ImageUploader.new(@customer, customer_params)
        if @upload.call
          render json: @customer, status: :ok
        else
          render json: @customer.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @customer = Customer.find(params[:id])

        if @customer.destroy
          render json: { message: "Your customer has successfully been terminated." } 
        else
          render json: { message: "Could not find the customer you are trying to remove." }
        end
      end

      private

      def customer_params
        params.permit(:id, :custname, :image, :user_id)
      end

    end
  end
  end