class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new # For the new comment form
  end
end
