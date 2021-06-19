# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/sendnotification_email
  def sendnotification_email
    NotificationMailer.sendnotification_email
  end

end
