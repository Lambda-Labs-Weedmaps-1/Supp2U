module Api
    module V1
      class UsersController < ApplicationController

        def index
            @users = User.all

            render json: @users
        end

        def show 
            @user = User.find(params[:id])

            render json: @user
        end

        def create #this will be converted to registration
            @user = User.new(user_params)

            if @user.save
                render json: @user, status: :created
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        def update
            @user = User.find(params[:id])

            if @user.update(user_params)
                render json: @user, status: :created
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @user= User.find(params[:id])

            if @user.destroy
                render json: { message: "Your user has successfully been terminated." }
            else
                render json: { message: "Could not find the user you are trying to remove." }
            end
        end

        private

        def user_params
            params.permit(:username, :email, :password, :wallet)
        end

      end
    end
  end