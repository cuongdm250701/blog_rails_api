class CategoryPostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category_posts, only: [:update, :destroy, :show]
    authorize_resource

    def index
        @category_posts = CategoryPost.filter_by_title params[:title]
        json_response({ message: "Successfully !", data: @category_posts })
    end

    def create
        params_create_category_post = category_posts_create_params
        params_create_category_post[:posts_attributes].each do |post|
            post[:user_id] = current_user.id
        end if params_create_category_post.key?("posts_attributes")
        @category_posts = CategoryPost.create!(params_create_category_post)
        json_response({ data: @category_posts }, :created)
    end


    def update
        if @category_posts.update(category_posts_params)
            json_response({ data: @category_posts })
        else
            error_response
        end
    end

    def destroy
        if @category_posts.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    def show
        json_response({data: @category_posts})
    end


    private

    def category_posts_params
        params.require(:category_posts).permit(:title)
    end

    def category_posts_create_params
        params.require(:category_posts).permit(:title, :posts_attributes => [:title, :content])
    end

    def set_category_posts
        @category_posts = CategoryPost.find_by(id: params[:id])
    end

end
