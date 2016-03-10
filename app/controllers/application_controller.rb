class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :has_pending_challenges?
  helper_method :both_guesses_submitted?
  helper_method :challenger?
  helper_method :challengee?
  helper_method :headshot_post_save
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def challengee?
    challenge = Challenge.find(params[:id])
    current_user.id == challenge.assigned_user.to_i
  end

  def challenger?
    challenge = Challenge.find(params[:id])
    current_user.id == challenge.user_id
  end

  def has_pending_challenges?
    current_user.challenges.where(status: "accepted")
  end

  def headshot_post_save(filepath)
    image_path = filepath.split("public")[1][1..-1]
    pic = File.new('public/' + image_path)
    session[:current_image] = image_path.split('/').last
    @headshotphoto = HeadshotPhoto.new
    @headshotphoto.image_upload = pic
    @headshotphoto.save
  end

end
