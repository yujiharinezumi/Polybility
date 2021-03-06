class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  before_action :check_user, only:[:edit,:update,:destroy]

  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: t('posts.finished')
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id )
    @favorite_count = Favorite.where(post_id: @post.id).count
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: t('posts.edited')
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: t('posts.deleted')
  end

  def check_user
    if @post.user.id != current_user.id
      redirect_to posts_path, notice: t('posts.not_authenticate')
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content,:image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
