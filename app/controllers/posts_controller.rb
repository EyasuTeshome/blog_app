class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = Post.where(user_id: params[@user.id])
  end

  def show
    @posts = Post.find(params[:id])
  end
end
