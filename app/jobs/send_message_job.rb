class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
     html = "<p><strong>#{message.conversation.sender.full_name}</br> #{message.body}</strong></p>"
        chat_id = [message.conversation.sender_id, message.conversation.recipient_id].sort.join("")
    ActionCable.server.broadcast("message_channel_#{chat_id}", html: html)


  end
end
