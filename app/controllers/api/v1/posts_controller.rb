class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts
  end

  def show
    @posts = Post.find(params[:id])
    render json: @posts
  end
end