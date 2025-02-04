class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not created.'
    end

  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to @post, notice: 'Comment was successfully destroyed.'
    else
      redirect_to @post, notice: 'Comment was not destroyed.'
    end

  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
