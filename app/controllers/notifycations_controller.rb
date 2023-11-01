class NotifycationsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_notifycation, only: [:show, :destroy]
    def index
        @notifycations = Notifycation
        .list_notifycation(current_user.id)
        .search_by_title(params[:title])
        .search_by_content(params[:content])
        json_response({ message: "Successfully", data: @notifycations })
    end

    def show
        json_response({ message: "Successfully !", data: @notifycation })
    end

    def change_status_read
        notifycations = Notifycation
        .where(id: params[:notifycation_id])
        .where(receiver_id: current_user.id)
        notifycations.update_all(is_read: params[:is_read])
        json_response({ message: "Successfully" })
    end

    def destroy
        if @notifycation.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    private

    def find_notifycation
        @notifycation = Notifycation.find_by(id: params[:id], receiver_id: current_user.id)
    end
end
