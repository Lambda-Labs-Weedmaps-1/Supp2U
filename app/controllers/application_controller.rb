class ApplicationController < ActionController::API
    include Knock::Authenticable

    private
    
    def unauthorized_entity(entity_name)
        render json: {error: "Unauthorized request"}, status: :unauthorized
    end

end
