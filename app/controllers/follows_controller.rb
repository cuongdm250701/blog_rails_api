class FollowsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_exist_user, only: [:create]
    before_action :check_follow_exists, only: [:create]


    def index
        @follows = Follow
            .list_user_followed(current_user.id)
            .search_by_username(params[:username])
            .search_by_email(params[:email])
        json_response({ message: "Successfully", data: @follows })
    end

    def create
        @follow =  @user.be_followed.new(follow_params)
        @follow.follower_by_user = current_user
        if @follow.save
            json_response({ message: "Successfully !" })
        else
            error_response
        end
    end

    def destroy
        @follow = Follow.find_by(id: params[:id], follower_by_user_id: current_user.id)
        if @follow && @follow.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    def receive_notifycation
        @follower = Follow.find_by(followed_user_id: params[:user_id], follower_by_user_id: current_user.id)
        if @follower
            json_response({ message: "Successfully" }) if @follower.update(is_receive_notifycation: params[:is_receive])
        else
            error_response
        end
    end

    private 

    def check_exist_user
        @user = User.find_by(id: follow_params[:followed_user_id])
        json_response({ message: "User is not exists" }) if !@user
    end

    def check_follow_exists
        follow = Follow.find_by(followed_user_id: follow_params[:followed_user_id], follower_by_user_id: current_user.id)
        json_response({ message: "This user has been followed before" }) if follow
    end

    def follow_params
        params.require(:follow).permit(:followed_user_id)
    end

end
