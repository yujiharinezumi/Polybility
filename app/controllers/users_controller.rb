class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]


  def index
     if params[:search]
       @results = User.ransack(params[:q]).result.page(params[:page]).per(8)
    else
      @results = User.all.page(params[:page]).per(8)
    end

    @languages = Language.all
    @labels = Label.all
  end

  def show
    @user = User.find(params[:id])
    @users = @user.posts
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
    params.require(:user).permit(:name, :icon, :age, :gender, :country, :native_language, :learning_language, :hobby,:introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
