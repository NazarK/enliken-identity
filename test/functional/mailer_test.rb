require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "email_verification" do
    mail = Mailer.email_verification
    assert_equal "Email verification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
