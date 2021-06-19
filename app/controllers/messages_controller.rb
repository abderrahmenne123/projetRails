class MessagesController < ApplicationController
    before_action :find_conversation
  
    def index
      @messages = @conversation.message
  
      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end
  
      if params[:m]
        @over_ten = false
        @messages = @conversation.message
      end
  
      @message = @conversation.message.new
    end
  
    def create
      @message = @conversation.message.new(message_params)
      if @message.save
        SendMessageJob.perform_now(@message)
        SendMessageNotificationJob.perform_now(@message)
        redirect_to conversation_messages_path(@conversation)
      end
    end
  
    def new
      @message = @conversation.message.new
    end
  
  
  
    private
  
      def message_params
        params.require(:message).permit(:body, :user_id)
      end
  
      def find_conversation
        @conversation = Conversation.find(params[:conversation_id])
      end
  end