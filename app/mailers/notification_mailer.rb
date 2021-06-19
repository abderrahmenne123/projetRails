class NotificationMailer < ApplicationMailer

  default from: 'from@example.com'
  def sendnotification_email(user,test,context)

    @user = user
    @test = test
    @context=context
    mail to: user.email,subject: 'Sample Email'

  end
end
