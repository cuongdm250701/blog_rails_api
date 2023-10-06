class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from CanCan::AccessDenied, with: :render_forbidden_response
    include Response
    include Auth
    before_action :process_token
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,
          keys: [:username, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in,
          keys: [:login, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update,
          keys: [:username, :email, :password_confirmation, :current_password])
    end

    def render_unprocessable_entity_response error, status: :unprocessable_entity
      render json: error.record.errors, status: status
    end

    def render_forbidden_response exception
      json_response({ message: exception }, :forbidden)
    end
end
