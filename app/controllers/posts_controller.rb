class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to challenge_path(@post.challenge_id)
    else
      flash[:error] =  "Please fill in all fields."
      redirect_to challenge_path(@post.challenge_id)
    end
  end

  
end
