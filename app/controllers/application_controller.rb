class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :has_pending_challenges?
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
    Challenge.where(assigned_user: current_user.id).where(status: 0)
  end

end
