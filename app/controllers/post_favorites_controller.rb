class PostFavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :check_post, only: [:create, :destroy]
    before_action :check_post_favorite_exist, only: [:create]

    def index
        @post_favorites = PostFavorite.list_post_favorites current_user.id
        json_response({ message: "Successfully", data: @post_favorites })
    end

    def create
        @post_favorite = PostFavorite.new
        @post_favorite.post = @post
        @post_favorite.user = current_user
        if @post_favorite.save
            json_response({ message: "Sucessfully !"})
        else
            error_response
        end
    end

    def destroy
        @post_favorite = PostFavorite.find_by(id: params[:id], user_id: current_user.id)
        if @post_favorite && @post_favorite.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    private

    def check_post
        @post = Post.find_by(id: params[:post_id], status: Post.statuses[:approved])
        json_response({message: "This post invalid"}) if !@post 
    end

    def check_post_favorite_exist
        post_favorite = PostFavorite.find_by(user_id: current_user.id, post_id: params[:post_id])
        json_response(message: "This post has been liked before") if post_favorite
    end

end
