class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @users = User.page(params[:page]).search(params[:search])
      @Conversations = Conversation.page(params[:page]).conversation_rechercher(params[:conversation_rechercher])
    end
  
    def create
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    end
    



    private
      def conversation_params
        params.permit(:sender_id, :recipient_id)
      end
  
end

