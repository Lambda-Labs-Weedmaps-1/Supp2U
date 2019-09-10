
module Api
    module V1
      class BusinessesController < ApplicationController

        def index
            if params[:user_id].present?
                @businesses = Business.where(user_id: params[:user_id])
            else
                @businesses = Business.all
            end
            render json: @businesses.with_attached_image
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
            puts @business


            @upload = ImageUploader.new(@business, update_params)
            # if @business.update(update_params)
            #     render json: @business, status: :created
            # else
            #     render json: @business.errors, status: :unprocessable_entity
            # end
            if @upload.call
                render json: @business, status: :ok
            else
                render json: @business.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @business = Business.find(params[:id])

            if @business.destroy
                render json: { message: "Your business has successfully been terminated." } 
            else
                render json: { message: "Could not find the business you are trying to remove." }
            end
        end

        def ratings
            @all_ratings = Business.find(params[:id]).reviews.pluck(:rating)
            @sum = @all_ratings.reduce(:+)
            @rating = Float(@sum/@all_ratings.length).ceil(1)

            render json: @rating
        end


        private

        #user_id will need to be passed in on the front end.
        def business_params
            params.permit(:name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :long, :lat, :user_id, :image)
        end

        def update_params
           params.permit(:id, :image, :name, :website, :city, :state, :street, :zipcode, :building_number, :theme, :description, :long, :lat)
        end

      end
    end
end
