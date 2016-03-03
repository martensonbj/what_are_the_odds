class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to challenges_path
    else
      flash.now[:error] = "All fields must be filled in."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone)
  end

end
