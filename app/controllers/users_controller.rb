class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  def index
     if params[:search]
       @users = User.ransack(params[:q])
    else
      @users = User.all.all.includes(:tags)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :age, :gender, :country, :native_language, :learning_language, :hobby)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
