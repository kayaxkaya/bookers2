class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def index
      @users = User.all
      @user = current_user
  end

  def show
      @user = User.find(params[:id])
      @books = Book.all
      @user_books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     @user.update(user_params)
     if @user.save
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path
     else
       render :edit
     end
  end

   private

  def is_matching_login_user
    user = User.find(params[:id])
    if current_user.id !=user.id
       redirect_to user_path(current_user.id)
    end
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
