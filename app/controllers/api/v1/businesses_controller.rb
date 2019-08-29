module Api
    module V1
      class BusinessesController < ApplicationController

        def index
            @businesses = Business.all

            render json: @businesses
        end

        def show
            @business = Business.find(params[:id])

            render json: @business
        end

        def create
            @business = Business.new( business_params )

            if @business.save
                render json: @business, status: :created
            else
                render json: @business.errors, status: :unprocessable_entity
            end
        end

        def update
            @business = Business.find(params[:id])

            if @business.update(update_params)
                render json: @business, status: :created
            else
                render json: @business.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @business = Business.find(params[:id])

            if @business.destroy
                render json: { message: "You're business has been successfully removed from the database."}
            else
                render json: { message: "Could not find the business you wanted to destroy."}
            end
        end

        private

        def business_params
            params.permit(:name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :hours, :long, :lat, :user_id)
        end

        def update_params
            params.permit(:name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :hours, :long, :lat)
        end

      end
    end
  end