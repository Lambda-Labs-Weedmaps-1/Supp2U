class ControllernameController < ApplicationController
  def new
    render json: {message: "message"}
  end
end
