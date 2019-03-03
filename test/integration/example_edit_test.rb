require 'test_helper'

class ExampleEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:carlie)
		@example = examples(:two)
	end

	test "invalid edit" do
		log_in_as(@user)
		patch example_path(@example), params: { example: { title: "   ",
																											 category: "   " } }
		assert_not flash.empty?
	end

	test "valid edit" do
		log_in_as(@user)
		patch example_path(@example), params: { example: { title: @example.title,
																											 category: @example.category } }
		assert_not flash.empty?
	end

	test "should redirect update when not logged in" do
		patch example_path(@example), params: { example: { title: @example.title,
																											 category: @example.category } }
		assert_not flash.empty?
		assert_redirected_to login_url
	end
end
