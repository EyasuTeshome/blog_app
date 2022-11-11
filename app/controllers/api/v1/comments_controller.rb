class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

    def index
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post_id: params[:post_id])
      render json: @comments

    end

    def create
      @post = Post.find(params[:post_id])

      return unless @post.comments.create(text: params[:comment][:text], author: @current_user)

      render json: { success: 'Comment created successfully' }
    end
  end
