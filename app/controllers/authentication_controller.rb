class Api::V1::AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
        @customer = User.find_by_email(params[:email]).customer
        @business = User.find_by_email(params[:email]).business

        if @customer.present?

            token = JsonWebToken.encode(user_id: @customer.user_id)
            time = Time.now + 72.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%y %H:%M"), customer: @customer }, status: 200
        elsif @business.present?
              token = JsonWebToken.encode(user_id: @business.user_id)
              time = Time.now + 72.hours.to_i
              render json: { token: token, exp: time.strftime("%m-%d-%y %H:%M"), business: @business }, status: 200
        else
            @user = User.new(user_params)
            if @user.save
                render json: @user, status: :created
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end
    end


    private

    def user_params
        params.permit(:username, :email, :password, :wallet, :is_admin)
    end

    def auth_params
        params.permit(:email, :password)
    end
end
