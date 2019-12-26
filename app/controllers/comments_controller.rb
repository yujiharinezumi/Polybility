class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id


    respond_to do |format|
      if @comment.save
          format.js { render :index }
       else
         format.html { redirect_to post_path(@post), notice: '投稿できませんでした...' }
       end
     end
   end


   def edit
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(:id)
   end

   def update
      @comment = @article.comments.find(params[:id])

      respond_to do
        if @comment.update(comment_params)
          format.js { render :index}
        else
          format.js { render :errors }
        end
      end

   end


   def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])

     respond_to do |format|
       if current_user.id == @comment.user.id
          @comment.destroy
          format.js { render :index }
        else
          format.html { redirect_to post_path(@post), notice: '削除できませんでした...' }
        end

     end

   end

     private

     def comment_params
       params.require(:comment).permit(:post_id, :content)
     end
end
