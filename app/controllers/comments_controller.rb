class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    posts = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post = posts
    if comment.save
      flash[:success] = 'Comment successfully created!'
    else
      flash[:error] = 'Comment creation failed!'
    end
    redirect_to user_post_path(current_user, posts)
  end

  def new
    @comment = Comment.new
    @posts = Post.find(params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy
    @post.save
    flash[:notice] = 'Comment was successfully deleted'
    redirect_to user_post_path(current_user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
