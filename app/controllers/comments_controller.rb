class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if params[:username] != ""
      comment.user_id = User.create(username: params[:username], email: params[:email]).id
      comment.save
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username, :email])
  end
end
