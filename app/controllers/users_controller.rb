class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to challenges_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone)
  end

end
