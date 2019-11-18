class CommentsController < ApplicationController
	def create
    comment = Comment.new(comment_params)
    current_user.comments << comment
    comment.save
    redirect_to article_path(comment_params[:article_id])
	end

  private

  def comment_params
    params.permit(:body, :article_id)
  end
end
