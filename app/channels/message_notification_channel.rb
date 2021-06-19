class MessageNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_notification_channel_#{params[:user_id]}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
