class UsersController < ApplicationController

  before_action :set_search

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

  def destroy
    @user = User.find_by(id:params[:id])
    if @user.id == current_user.id
      @user.destroy
      redirect_to root_path
    end
  end

  def set_search
    @search = Recipe.ransack(params[:q])
    @results = @search.result(distinct: true)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile, :profile_image, :password, :password_confirmation, :email)
  end
end
