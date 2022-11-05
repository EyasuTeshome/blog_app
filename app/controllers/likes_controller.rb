class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.author = current_user
    like.post = post
    if like.save
      flash[:success] = 'Liked successfully'
    else
      flash[:error] = 'Error while trying to like'
    end
    redirect_to user_post_path(current_user, post)
  end
end
