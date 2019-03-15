require 'test_helper'

class ExampleEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:carlie)
		@example = examples(:two)
	end

	test "invalid edit" do
		log_in_as(@user)
		patch example_path(@example), params: { example: { style: "   ",
																											 category: "   " } }
		assert_not flash.empty?
	end

	test "valid edit" do
		log_in_as(@user)
		get works_path
		assert_select "a:match('href', ?)", edit_example_path(@example)
		patch example_path(@example), params: { example: { style: "style" } }
		assert_not flash.empty?
		assert_redirected_to root_url
		@example.reload
		assert_equal "style", @example.style
	end

	test "should redirect update when not logged in" do
		patch example_path(@example), params: { example: { style: @example.style,
																											 category: @example.category } }
		assert_not flash.empty?
		assert_redirected_to login_url
	end
end
