class CommentsController < ApplicationController
skip_before_action :authorize, only: :index 

    def create
        comment = @current_user.comments.create!(comment_params)
        render json: comment, status: :created
    end

    def update
        comment = @current_user.comments.find(params[:id])
        comment.update!(comment_params)
        render json: comment
    end

    def destroy
        comment = @current_user.comments.find(params[:id])
        comment.destroy
        head :no_content
    end

    private

    def comment_params
        params.permit(:comment, :blog_id)
    end

end
