require 'test_helper'

class ExperienceEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:carlie)
		@experience = experiences(:two)
	end

	test "invalid edit" do
		log_in_as(@user)
		patch experience_path(@experience), params: { experience: { company: "   ",
																														    year: "   " } }
		assert_not flash.empty?
	end

	test "valid edit" do
		log_in_as(@user)
		patch experience_path(@experience), params: { experience: { company: @experience.company,
																														    year: @experience.year } }
		assert_not flash.empty?
	end

	test "should redirect update when not logged in" do
		patch experience_path(@experience), params: { experience: { company: @experience.company,
																														    year: @experience.year } }
		assert_not flash.empty?
		assert_redirected_to login_url
	end
end
