module Api
	module V1
		class BusinessesController < ApplicationController
			def index
				@businesses =
					if params[:user_id].present?
						Business.where(user_id: params[:user_id]).first
					else
						Business.all
					end
				render json: @businesses.with_attached_image
			end

			def show
				@business = Business.find(params[:id])

				render json: @business
			end


      def create
        @business = Business.new(business_params)
        puts('business stuff coming in', @business.inspect)
        stripe_ip = request.remote_ip

        @stripeCreate = StripeChargesServices.new(business_params, @business, stripe_ip)

				if @business.save
					@stripeCreate.busCall
					render json: @business, status: :created
				else
					render json: @business.errors, status: :unprocessable_entity
				end
			end

			def update
				@business = Business.find(params[:id])

				@upload = ImageUploader.new(@business, update_params)

				if @upload.call
					render json: @business, status: :ok
				else
					render json: @business.errors, status: :unprocessable_entity
				end
			end

			def destroy
				@business = Business.find(params[:id])

				if @business.destroy
					render json: {
							message: 'Your business has successfully been terminated.'
					       }
				else
					render json: {
							message: 'Could not find the business you are trying to remove.'
					       }
				end
			end

			def ratings
				all_ratings = Business.find(params[:id]).reviews.pluck(:rating)
				sum = all_ratings.reduce(:+)
				rating = sum.nil? ? 0 : Float(sum / all_ratings.length).ceil(1)
				render json: rating
			end

			private

			#user_id will need to be passed in on the front end.
			def business_params
				params.permit(
					:name,
					:website,
					:city,
					:state,
					:street,
					:zipcode,
					:building_number,
					:theme,
					:description,
					:long,
					:lat,
					:user_id,
					:image,
					:stripe_email,
					:stripe_token,
					:token
				)
			end

			def update_params
				params.permit(
					:id,
					:image,
					:name,
					:website,
					:city,
					:state,
					:street,
					:zipcode,
					:building_number,
					:theme,
					:description,
					:long,
					:lat
				)
			end
		end
	end
end
