require 'test_helper'

class ExamplesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@example = examples(:one)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Example.count' do
			post examples_path, params: { example: { title: "Highlight Reel",
																							 category: "video" } }
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Example.count' do
			delete example_path(@example)
		end
		assert_redirected_to login_url
	end
end
