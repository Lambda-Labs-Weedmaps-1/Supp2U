module Api
    module V1
      class ReviewsController < ApplicationController

        def index
          if params[:customer_id].present?
            @reviews = Customer.find(params[:customer_id]).reviews
          elsif params[:business_id].present?
            @reviews = Business.find(params[:business_id]).reviews
          end
          render json: @reviews
        end

        
        def create
          #ensures that a Customer can only leave one review per review to prevent review spamming.
          @has_review = Customer.find(params[:customer_id]).reviews.where(business_id: review_params[:business_id] )
          @review = Review.new(review_params)

          if @has_review.length > 0
            render json: { message: "You have already left a review. Thank you for your feedback.", proof: @has_review }, status: :unprocessable_entity
          elsif @review.save
            render json: @review, status: :created
          else
            render json: @review.errors, status: :unprocessable_entity
          end
        end

        def show
          @review = Review.find(params[:id])

          if @review
            render json: @review, status: :ok
          else
            render json: @review.errors, status: :unprocessable_entity
          end
        end



        def update
          @review = Review.find(params[:id])

          if @review.update(review_params)
            render json: @review, status: :created
          else
            render json: @review.errors, status: :unprocessable_entity
          end
        end

        def destroy
          @review = Review.find(params[:id])

          if @review.destroy
              render json: { message: "Your review has successfully been terminated." } 
          else
              render json: { message: "Could not find the review you are trying to remove." }
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