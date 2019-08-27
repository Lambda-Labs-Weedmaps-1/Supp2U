class WelcomeController < ApplicationController

    def index 
        render json: "hello... hope this works"
    end
end
