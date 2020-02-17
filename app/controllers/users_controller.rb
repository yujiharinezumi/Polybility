class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,:following, :followers]
  before_action :authenticate_user!

  def index
    if params[:search]
      @results = User.ransack(params[:q]).result.page(params[:page]).per(8)
    else
      @results = User.all.order(id: "DESC").page(params[:page]).per(8)
    end

    @languages = Language.all
    @labels = Label.all
  end

  def show
    @users = @user.posts
  end

  def following
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :age, :gender, :country, :native_language, :learning_language,:introduction, label_ids: [] )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
