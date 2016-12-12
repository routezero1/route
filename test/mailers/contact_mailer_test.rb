require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
    test "should return contact email" do
        mail = ContactMailer.contact_email("aa01558@surrey.ac.uk", "Aras", "1234567890", @message = "Hello")
        assert_equal ['info@route.com'], mail.to
        assert_equal ['info@route.com'], mail.from
    end
end
