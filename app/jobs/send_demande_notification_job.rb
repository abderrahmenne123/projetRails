class SendDemandeNotificationJob < ApplicationJob
  queue_as :default

  def perform(demande)
    # Do something later
    html = "<a href='/' class='dropdown-item'> <div class='media'><img src=''><div class='media-body'> <h3 class='dropdown-item-title'>#{demande.sender.full_name} <span class='float-right text-sm text-warning'><i class='fas fa-star'></i></span> </h3><p class='text-sm'>#{demande.body}</p> </i>  </div></div>  </a><div class='dropdown-divider'></div>"
  
    @user_id = demande.recipient_id
    ActionCable.server.broadcast("demande_notification_channel_#{@user_id}", html: html)
  end
end
