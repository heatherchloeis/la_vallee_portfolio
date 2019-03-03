require 'test_helper'

class EducationsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@education = educations(:one)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Education.count' do
			post educations_path, params: { education: { school: "Art Institute, San Francisco",
																									 year: "2009 - 2010",
																									 degree: "BA",
																									 major: "1D Modeling in Animation and Gaming" } }
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Education.count' do
			delete education_path(@education)
		end
		assert_redirected_to login_url
	end
end
