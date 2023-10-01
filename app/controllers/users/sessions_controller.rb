class Users::SessionsController < Devise::SessionsController
    before_action :verify_signed_out_user, only: [:destroy]

    def create
        resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        if resource
          resource.update_attributes!(is_login: true)
          token = resource.generate_jwt
          json_response({ user: resource, token: token })
        else
          json_response({ error: 'Login fail !' })
        end
    end

    def destroy
      if current_user.update_attributes!(is_login: false)
        json_response({message: 'Successfully !'})
      else
        json_response({ message: 'Error !' })
      end
    end

    def verify_signed_out_user
      authenticate_user!
    end

end