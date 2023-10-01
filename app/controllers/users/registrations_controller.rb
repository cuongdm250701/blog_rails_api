class Users::RegistrationsController < Devise::RegistrationsController
    
    def create
        build_resource(sign_up_params)
        if resource.save
            resource.update_attributes!(is_login: true)
            token = resource.generate_jwt
            json_response({message: 'Successfully !', user: resource, token: token})
        else
            json_response({message: 'Create user fail !'})
        end
    end
end