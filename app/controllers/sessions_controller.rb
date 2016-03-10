class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])

    if @user && @user.email == nil
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id)
      flash[:success] = "Welcome, #{@user.name}!"
    end

    if @user && @user.email
      session[:user_id] = @user.id
      redirect_to challenges_path
    end 
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] = 'Successfully Logged Out'
    end
    redirect_to root_path
  end

end
