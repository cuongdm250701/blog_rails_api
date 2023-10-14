class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post
    before_action :set_comment, only: [:update, :destroy]
    before_action :delete_is_allowed, only: [:destroy]


    def index
        @comments = Comment.comments_by_post_id(params[:post_id])
        json_response({ message: "Successfully", data: @comments })
    end

    def create
        @comment = @post[0].comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            json_response({ message: "Sucessfully !", data: @comment })
        else
            error_response
        end
    end

    def update
        if @comment.update(comment_params)
            json_response({ message: "Successfully !", data: @comment })
        else
            error_response
        end
    end

    def destroy
        if @comment.destroy
            json_response({message: 'Deleted'})
        else
            error_response
        end
    end

    private

    def find_post
        @post = Post
             .filter_post_by_id(params[:post_id])
             .filter_post_approved(Post.statuses[:approved])
        json_response({ message: "params post_id is not exist" }) if @post.length == 0
    end

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def delete_is_allowed
        is_allowed = true if current_user.id == @comment.user_id || current_user.role == User.roles[:admin]
        json_response({ message: "You are not allowed to delete this comment" }) if !is_allowed
    end

end
