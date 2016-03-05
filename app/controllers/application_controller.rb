class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :has_pending_challenges?
  helper_method :both_guesses_submitted?
  helper_method :challenger?
  helper_method :challengee?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    redirect_to root_path unless current_user
  end

  def has_pending_challenges?
    current_user.challenges.where(status: "accepted")
  end

  def challengee?
    challenge = Challenge.find(params[:id])
    current_user.id == challenge.assigned_user.to_i
  end

  def challenger?
    challenge = Challenge.find(params[:id])
    current_user.id == challenge.user_id
  end

  def both_guesses_submitted?
    challenge = Challenge.find(params[:id])
    challenge.challenger_guess && challenge.challengee_guess
  end

end
