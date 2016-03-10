class PostsController < ApplicationController


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to challenge_path(@post.challenge_id)
    else
      flash[:error] =  "Message can't be blank!"
      redirect_to challenge_path(@post.challenge_id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :challenge_id)
  end


end
