require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User",
										 email: "user@example.com",
										 title: "Admin",
										 password: "password",
										 password_confirmation: "password",
										 bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel tincidunt lorem. Donec ac est lorem. Ut vitae magna facilisis, tincidunt quam ac, fringilla nunc. Morbi at facilisis augue. Sed vitae iaculis odio, non blandit justo. Vestibulum posuere vel enim eu viverra. Sed aliquam ornare arcu, sed suscipit risus. Nulla tristique ante quis euismod pharetra. Nunc bibendum, augue vel mollis consectetur, orci lectus condimentum metus, id viverra augue est eu ante. Donec sit amet sem erat. Aenean ut euismod arcu. Donec fermentum tincidunt quam ut facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.")
		@other_user = User.new(name: "Other User",
										 			 email: "other_user@example.com",
										 			 password: "password",
										 			 password_confirmation: "password",
										 			 title: "artist",
										 			 bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel tincidunt lorem. Donec ac est lorem. Ut vitae magna facilisis, tincidunt quam ac, fringilla nunc. Morbi at facilisis augue. Sed vitae iaculis odio, non blandit justo. Vestibulum posuere vel enim eu viverra. Sed aliquam ornare arcu, sed suscipit risus. Nulla tristique ante quis euismod pharetra. Nunc bibendum, augue vel mollis consectetur, orci lectus condimentum metus, id viverra augue est eu ante. Donec sit amet sem erat. Aenean ut euismod arcu. Donec fermentum tincidunt quam ut facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.")
	end

	test "should be valid" do 
		assert @user.valid?
	end

	test "name email, title, password, and bio should be present" do 
		@user.name = "   "
		@user.email = "   "
		@user.password = "   "
		@user.title = "   "
		@user.bio = "   "
		assert_not @user.valid?
	end

	test "name, password, title, and bio should have min characters" do
		@user.name = "a" * 3
		@user.password = "a" * 7
		@user.title = "a" * 3
		@user.bio = "a" * 3
		assert_not @user.valid?		
	end

	test "name, email, and title should have max characters" do
		@user.name = "a" * 51
		@user.email = "a" * 241 + "example.com"
		@user.title = "a" * 241
		assert_not @user.valid?
	end

	test "name and email should contain valid characters" do
		valid_names = %w[Example\ User ExampleUser Ex.\ AmPlE\ uSeR]
		valid_names.each do |valid_name|
			@user.name = valid_name
			assert @user.valid?
		end
		valid_emails = %w[user@example.com example_USER@example.com example+user1@example.co ex.ample-user@example.user.com]
		valid_emails.each do |valid_email|
			@user.email = valid_email
			assert @user.valid?
		end
	end

	test "email should not contain invalid characters" do
		invalid_emails = %w[user@example,com $user()example.co user_at_example user@ex+ample.com user@ex_ample.com user@example.]
		invalid_emails.each do |invalid_email|
			@user.email = invalid_email
			assert_not @user.valid?
		end
	end

	test "email should be unique" do
		# Check duplicate email
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
		mixed_case_email = "UsEr@ExAmPlE.com"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	# User login/logout testing suite

	test "authenticated? should return false for a user with nil digest" do
		assert_not @user.authenticated?(:remember, '')
	end
end