class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:success] = "Welcome, #{@user.name}!"
    else
      redirect_to root_path
      flash[:warning] =  "There was an error with your authentication."
    end
  end

  def destroy
    if current_user
      # session.delete(:user_id)
      session[:user_id] = nil
      flash[:success] = 'Successfully Logged Out'
    end
    redirect_to root_path
  end

end
