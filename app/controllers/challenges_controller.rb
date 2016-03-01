class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
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

  private

  def challenge_params
    params.require(:challenge).permit(:title, :assigned_user, :expiration_date, :message, :video, :user_id)
  end

end
