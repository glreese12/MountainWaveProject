require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "event_created" do
    mail = Notifier.event_created
    assert_equal "Event created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
