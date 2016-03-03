class ChallengesController < ApplicationController

  def index
    @sent_challenges = Challenge.all.where(user_id: current_user.id)
    @pending_challenges = Challenge.where(assigned_user: current_user.id)
  end

  def new
    @challenge = Challenge.new
    fb = FriendBuilder.new
    @friends = fb.build_friends(current_user)
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to challenges_path
      flash[:success] = "Challenge Sent!"
    else
      redirect_to new_challenge_path
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def destroy
    challenge = Challenge.find(params[:id])
    challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :assigned_user, :expiration_date, :message, :video, :user_id)
  end


end
