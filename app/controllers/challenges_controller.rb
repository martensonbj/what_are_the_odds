class ChallengesController < ApplicationController
  before_action :find_challenge, only: [:edit, :update, :destroy, :show]
  before_action :get_posts, only: [:update, :show]
  helper :headshot
  before_action :get_images, only: [:show]

  def index
    @sent_challenges = Challenge.get_sent_challenges(current_user)
    @pending_challenges = Challenge.get_pending_challenges(current_user)
  end

  def new
    @challenge = Challenge.new
      @friends = @challenge.get_friends(current_user)
    if @recorded_image
      @recorded_image = session[:current_image].split('/').last
    end
 end

  def edit
    if @recorded_image
      @recorded_image = session[:current_image].split('/').last
    end
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
    images = Bucket.new.get_aws_photos
    @challenge_video = get_challenge_video(images)
    @response_video = get_response_video(images)
  end

  def get_challenge_video(images)
    if @challenge.challenge_video
      challenge_key = @challenge.challenge_video.split('/').last
      @challenge_video = images[challenge_key]
    end
  end

  def get_response_video(images)
    if @challenge.response_video
      response_key = @challenge.response_video.split('/').last
      @response_video = images[response_key]
    end
  end

end
