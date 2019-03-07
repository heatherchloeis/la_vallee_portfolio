require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "new_contact" do
  	@contact = Contact.new(name: "Blah Animations",
  							 email: "headblah@blahanimations.com",
  							 message: "Lorem ipsum")
    mail = ContactMailer.new_contact(@contact)
    assert_equal "IMPORTANT New Contact Submission", mail.subject
    assert_equal [User.first.email], 								 mail.to
    assert_equal ["noreply@carlielavallee.com"], 		 mail.from
  end
end
