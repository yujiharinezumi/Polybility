class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only:[:edit,:update,:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: t('comments.cannot') }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index}
      else
        format.js { render :errors }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.id == @comment.user.id
        @comment.destroy
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: t('comments.cannot') }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
