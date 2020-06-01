class UsersController < ApplicationController
  def index
   @recipes = Recipe.all.order(id: "DESC")
   @recipe = Recipe.find_by(id:params[:id])
  end

  def chef
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @users = User.all 
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to "/"
    else
      redirect_to("/users/#{@user.id}/update")
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile, :profile_image, :password, :password_confirmation, :email)
  end
end
