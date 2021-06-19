require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "sendnotification_email" do
    mail = NotificationMailer.sendnotification_email
    assert_equal "Sendnotification email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
