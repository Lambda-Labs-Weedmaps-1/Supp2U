class HomeController < ApplicationController
    def index
        render json: {
            message: "Sanity test!! Welcome to the app!"
        }
    end
end
