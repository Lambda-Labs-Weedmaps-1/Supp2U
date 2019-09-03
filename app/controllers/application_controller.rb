class ApplicationController < ActionController::API
    include Knock::Authenticable

    def not_found
        render json: { error: "not found" }
    end


    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue => ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue => JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized   
        end
    end
      
    

    private
    
    def unauthorized_entity(entity_name)
        render json: {error: "Unauthorized request"}, status: :unauthorized
    end

end
