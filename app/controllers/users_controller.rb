class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end
end
