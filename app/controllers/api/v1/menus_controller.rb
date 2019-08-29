module Api
    module V1
      class MenusController < ApplicationController

        def index
          @menus = Menu.all

          render json: @menus
        end

        def show
          @menu = Menu.find(params[:business_id])

          render json: @menu
        end

        def create
          @menu = Menu.new(menu_params)

          if @menu.save
            render json: @menu, status: :created
          else
            render json: @menu.errors, status: :unprocessable_identity
          end
        end

        private
        
        def menu_params
          params.permit(:business_id, :name)
        end

      end
    end
  end