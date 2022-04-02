class CommentsController < ApplicationController
  before_action :set_post

  def create
    @post.comments.create! params.required(:comment).permit(:comment, :commenter)
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end