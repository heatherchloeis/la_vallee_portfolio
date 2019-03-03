require 'test_helper'

class EducationEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:carlie)
		@education = educations(:two)
	end

	test "invalid edit" do
		log_in_as(@user)
		patch education_path(@education), params: { education: { school: "   ",
																														 year: "   " } }
		assert_not flash.empty?
	end

	test "valid edit" do
		log_in_as(@user)
		patch education_path(@education), params: { education: { school: @education.school,
																														 year: @education.year } }
		assert_not flash.empty?
	end

	test "should redirect update when not logged in" do
		patch education_path(@education), params: { education: { school: @education.school,
																														 year: @education.year } }
		assert_not flash.empty?
		assert_redirected_to login_url
	end
end
