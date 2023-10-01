class CategoryPostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category_posts, only: [:update, :destroy, :show]

    def index
        @category_posts = CategoryPost.all
        json_response({ message: "Successfully !", data: @category_posts })
    end

    def create
        @category_posts = CategoryPost.create!(category_posts_params)
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
        params.permit(:title)
    end

    def set_category_posts
        @category_posts = CategoryPost.find_by(id: params[:id])
    end
end
