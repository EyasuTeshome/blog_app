class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @posts = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @posts = @user.posts.new(post_params)
    @posts.comments_counter = 0
    @posts.likes_counter = 0
    respond_to do |format|
      format.html do
        if @posts.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(@user)
        else
          flash[:error] = 'Post not created'
          render :new, locals: { posts: @posts }
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
