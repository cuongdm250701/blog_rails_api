module Auth
    include Response
    
    private

    def process_token
        if request.headers['Authorization'].present?
            begin
                jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], ENV['DEVISE_JWT_SECRET_KEY']).first
                @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                json_response({ message: "Invalid token" })
            end
        end
    end

    def authenticate_user!(options = {})
        json_response({ message: "User not loggin" }, :unauthorized) unless signed_in?
    end

    def current_user
        @current_user ||= super || User.find(@current_user_id)
    end

    def signed_in?
        is_login = current_user.is_login if @current_user_id.present?
    end
end