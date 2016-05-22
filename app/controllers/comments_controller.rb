class CommentsController < ApplicationController
  def create
      @link = Link.find(params[:link_id])
      @comment = @link.comments.new(comment_params)

      @comment.user_id = current_user.user_id
      @comment.save

      redirect_to link_path(@link), :flash => { :success => "Your comment has been saved" }
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :user_id)
    end
end
