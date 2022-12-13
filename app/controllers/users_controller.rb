class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
     is_matching_login_user
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
