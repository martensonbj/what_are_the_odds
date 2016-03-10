class ChallengesController < ApplicationController
  before_action :find_challenge, only: [:edit, :update, :destroy, :show]
  before_action :get_posts, only: [:update, :show]
  helper :headshot
  before_action :get_images, only: [:show]

  def index
      @sent_challenges = Challenge.all.where(user_id: current_user.id)
      @pending_challenges = Challenge.all.where(assigned_user: current_user.id.to_s)
  end

  def new
    @challenge = Challenge.new
    fb = FriendBuilder.new
    @friends = fb.build_friends(current_user)
    fs = FacebookService.new(current_user)
    fs.email
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      flash.now[:error] = "Challenge Updated!"
      render :show
    end
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to challenges_path
    else
      flash[:error] = "Please fill in required fields."
      redirect_to new_challenge_path
    end
  end

  def show
    bucket = Bucket.new
    images = bucket.get_aws_photos
    challenge_key = @challenge.challenge_video
    response_key = @challenge.response_video
    @challenge_video = images[challenge_key]
    @response_video = images[response_key]
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :assigned_user, :expiration_date, :message, :video, :user_id, :challenger_guess, :challengee_guess, :odds, :status, :response_message, :challenge_video, :response_video)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def get_posts
    @post = Post.new
    @posts = Post.where(challenge_id: @challenge.id)
  end

  def get_images
    bucket = Bucket.new
    images = bucket.get_aws_photos
    challenge_key = @challenge.challenge_video
    response_key = @challenge.response_video
    @challenge_video = images[challenge_key]
    @response_video = images[response_key]
  end

end
