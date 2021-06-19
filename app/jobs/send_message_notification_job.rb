class SendMessageNotificationJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    #source = url_for(message.conversation.sender.avatar)
    html = "<a href='' class='dropdown-item'> <div class='media'><img src=''><div class='media-body'> <h3 class='dropdown-item-title'>#{message.conversation.sender.full_name} <span class='float-right text-sm text-warning'><i class='fas fa-star'></i></span> </h3><p class='text-sm'>#{message.body}</p> </i>  </div></div>  </a>"
    #html = "bonojur"
    # chat_id = [message.conversation.sender_id, message.conversation.recipient_id].sort.join('')
    if message.user_id=message.conversation.recipient_id
      user_id =message.conversation.sender_id
    else
      user_id =  message.conversation.recipient_id
    end

    puts('broadcasting on message notification channel'+user_id.to_s)
    ActionCable.server.broadcast("message_notification_channel_#{user_id}", html: html)
    end
end
