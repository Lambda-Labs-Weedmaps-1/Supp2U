class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_email(params[:email])

    if @user.nil?
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    elsif @user.customer
      OrderMailer.with(user: @user).order_email.deliver_now
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 72.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%y %H:%M"), customer: @user.customer }, status: 200
      return
    elsif @user.business
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 72.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%y %H:%M"), business: @user.business }, status: 200
      return
    else
      render json: {message: "user is registered but is missing a profile ", error: @user.errors}, status: :unprocessable_entity
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
