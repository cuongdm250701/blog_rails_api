class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:update, :destroy, :show, :post_approval]
    before_action :check_require_reason, only: [:post_approval]
    authorize_resource only: [:post_approval]

    def index
        @posts = Post.ransack(search_params).result()
        json_response({ message: "Successfully !", data: @posts })
    end

    def create
        @category_post = CategoryPost.find(params[:category_post_id])
        @post = @category_post.posts.new(post_params)
        @post.user = current_user
        if @post.save
            json_response({ message: "Successfully !", data: @post })
        else
            error_response
        end
    end

    def update
        if @post.update(post_params)
            json_response({ message: "Successfully !", data: @post })
        else
            error_response
        end
    end

    def destroy
        if @post.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    def show
        json_response({data: @post})
    end

    def my_posts
        @posts = Post
            .posts_by_user(current_user.id)
            .filter_by_title(params[:title])
            .filter_by_status(params[:status])
            .filter_by_category_post_id(params[:category_post_id])

        json_response({ message: "Successfully !", data: @posts })
    end

    def post_approval
        if params[:reason] && params[:status] == Post.statuses[:refused]
            json_response({ message: "Successfully !", data: @post }) if @post.update(status: params[:status], reason: params[:reason])
            error_response if !@post.update(status: params[:status], reason: params[:reason])
        else
            json_response({ message: "Successfully !", data: @post }) if @post.update(status: params[:status])
            error_response if !@post.update(status: params[:status])
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post 
        @post = Post.find(params[:id])
    end

    def check_require_reason
        json_response({ message: "Reason must a string" }) if params[:reason].present? && params[:status] == Post.statuses[:refused] && params[:reason].class != String
        json_response({ message: "Require reason when select refused" }) if params[:status] == Post.statuses[:refused] && !params[:reason].present?
    end

    def search_params
        { 
            status_eq: params[:status],
            title_cont: params[:title],
        }
    end
end
