require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@experience = experiences(:one)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Experience.count' do
			post experiences_path, params: { experience: { company: "Pixar",
																									 	 location: "Los Angeles",
																									 	 year: "2018 - PRESENT",
																									 	 title: "3D Lighting Artist",
																									 	 desc: "Lorem ipsum" } }
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Experience.count' do
			delete experience_path(@experience)
		end
		assert_redirected_to login_url
	end
end
