class MessagesController < ApplicationController
  before_action do
      @conversation = Conversation.find(params[:conversation_id])
    end

    def index
      @messages = @conversation.messages
      if @messages.length > 10
        @over_ten = true
        @messages = Message.where(id: @messages[-10..-1].pluck(:id))
      end

      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end

      if @messages.last
        @messages.where.not(user_id: current_user.id).update_all(read: true)
      end

      @messages = @messages.order(:created_at)
      @message = @conversation.messages.build
    end

    def create
      @messages = @conversation.messages
      @message = @conversation.messages.build(message_params)
      @message.user_id = current_user.id
      respond_to do |format|
        if @message.save
          format.js { render :index }
        else
          format.html { redirect_to conversation_messages_path, notice: '投稿できませんでした...' }
        end
      end
    end


    def edit
    #     # @message = @conversation.messages.find(params[:id])
    end
    #
    #
    def update
    #   @message = @conversation.message.find(params[:id])
    #
    #   respond_to do |format|
    #     if @message.update(comment_params)
    #       format.js { render :index}
    #     else
    #       format.js { render :errors }
    #     end
    #   end

    end

    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to conversation_messages_path,notice:"メッセージを削除しました！"
    end

    private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def set_message

    end
end
