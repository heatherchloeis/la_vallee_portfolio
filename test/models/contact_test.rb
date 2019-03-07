require 'test_helper'

class ContactTest < ActiveSupport::TestCase
	def setup
  	@contact = Contact.new(name: "Blah Animations",
  							 email: "headblah@blahanimations.com",
  							 message: "Lorem ipsum")
	end

	test "valid contact" do 
		assert @contact.valid?
	end

	test "email should have max characters" do
		@contact.email = "a" * 241 + "example.com"
		assert_not @contact.valid?
	end

	test "name and email should contain valid characters" do
		valid_names = %w[Example\ User ExampleUser Ex.\ AmPlE\ uSeR]
		valid_names.each do |valid_name|
			@contact.name = valid_name
			assert @contact.valid?
		end
		valid_emails = %w[user@example.com example_USER@example.com example+user1@example.co ex.ample-user@example.user.com]
		valid_emails.each do |valid_email|
			@contact.email = valid_email
			assert @contact.valid?
		end
	end

	test "email should not contain invalid characters" do
		invalid_emails = %w[user@example,com $user()example.co user_at_example user@ex+ample.com user@ex_ample.com user@example.]
		invalid_emails.each do |invalid_email|
			@contact.email = invalid_email
			assert_not @contact.valid?
		end
	end
end
