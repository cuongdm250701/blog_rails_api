class Users::PasswordsController < Devise::PasswordsController
    before_action :authenticate_user!
    
    def update
        if current_user.valid_password?(params[:current_passwords])
            current_user.update(password: params[:passwords_confirmation])
            json_response({ message: "Successfully !" })
        else
            error_response
        end
    end

end