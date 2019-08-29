module Api
    module V1
      class ReviewsController < ApplicationController

        def index
          @reviews = Customer.find(params[:customer_id]).reviews
  
          render json: @reviews
        end

        def create
          #ensures that a Customer can only leave one review per business to prevent review spamming.
          @has_review = Customer.find(params[:customer_id]).reviews.where(business_id: review_params[:business_id] )
          @review = Review.new(review_params)

          if @has_review.length > 0
            render json: { message: "You have already left a review. Thank you for your feedback.", proof: @has_review }
          elsif @review.save
            render json: @review, status: :created
          else
            render json: @review.errors, status: :unprocessable_entity
          end
        end

        private
        def review_params
          #passing through the business_id needs to be handled on the front-end
          #Going to let the front-end handle and decide the range for the rating
          params.permit(:customer_id, :business_id, :review, :rating)
        end

      end
    end
  end