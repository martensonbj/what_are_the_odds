class ChallengesController < ApplicationController

  def index
    # @sent_challenges, @pending_challenges = Challenge.get_challenges()
    # ----> [22, 33]

    @sent_challenges = Challenge.all.where(user_id: current_user.id)
    @pending_challenges = Challenge.where(assigned_user: current_user.id)
  end

  def new
    @challenge = Challenge.new
    fb = FriendBuilder.new
    @friends = fb.build_friends(current_user)
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      redirect_to challenges_path
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
    @challenge = Challenge.find(params[:id])
  end

  def destroy
    challenge = Challenge.find(params[:id])
    challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    binding.pry
    params.require(:challenge).permit(:title, :assigned_user, :expiration_date, :message, :video, :user_id, :challenger_guess, :challengee_guess, :odds)
  end


end
