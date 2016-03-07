class ChallengesController < ApplicationController
  helper_method :check_status
  before_action :find_challenge, only: [:edit, :update, :destroy]

  def index
    @sent_challenges = Challenge.all.where(user_id: current_user.id)
    @pending_challenges = Challenge.all.where(assigned_user: current_user.id)
  end

  def new
    @challenge = Challenge.new
    fb = FriendBuilder.new
    @friends = fb.build_friends(current_user)
  end

  def edit
  end

  def update
    @post = Post.new
    @posts = Post.where(challenge_id: @challenge.id)
    if @challenge.update(challenge_params)
      render :show
    else
      flash.now[:error] = "All fields must be filled in."
      render :edit
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
    check_status
    @post = Post.new
    @posts = Post.where(challenge_id: @challenge.id)
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :assigned_user, :expiration_date, :message, :video, :user_id, :challenger_guess, :challengee_guess, :odds)
  end

  def check_status
    find_challenge
    if @challenge.guesses_match?
      @challenge.update_attributes(status: "activated")
    elsif @challenge.guesses_dont_match?
      @challenge.update_attributes(status: "dead")
    elsif @challenge.challengee_guess
      @challenge.update_attributes(status: "accepted")
    end
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

end
