class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post), notice: 'Comment was successfully created.'
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: 'Comment was successfully destroyed.'
  end

  private

    def set_post
      @post = Post.friendly.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
