require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:carlie)
	end

	test "invalid edit" do 
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), params: { user: { name: "",
																						 email: "foo@invalid",
																						 password: "foo",
																						 password_confirmation: "bar" } }
		assert_template 'users/edit'
	end

	test "valid edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		name = "Carlie LaVallee"
		title = "Lighting Artist"
		patch user_path(@user), params: { user: { name: name,
																							title: title,
																							password: "",
																							password_confirmation: "" } }
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal name, @user.name
		assert_equal title, @user.title
	end

	test "should redirect edit when not logged in" do
		get edit_user_path(@user)
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test "should redirect update when not logged in" do
		patch user_path(@user), params: { user: { name: @user.name,
																							title: @user.title } }
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test "valid edit with friendly forwarding" do
		get edit_user_path(@user)
		log_in_as(@user)
		assert_redirected_to root_url
		get edit_user_path(@user)
		name = "Foo Bar"
		email = "foo@bar.com"
		patch user_path(@user), params: { user: { name: name,
																							email: email,
																							password: "",
																							password_confirmation: "" } }
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal name, @user.name
		assert_equal email, @user.email
	end
end
