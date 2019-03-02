require 'test_helper'

class EducationTest < ActiveSupport::TestCase
	def setup
		@education = Education.new(school: "Art Institute, Vancouver",
															 year: "2012 - 2014",
															 degree: "BA",
															 major: "3D Modeling for Animation and Gaming")
	end

	test "should be valid" do
		assert @education.valid?
	end

	test "school, year, degree, and major should be present" do 
		@education.school = "   "
		@education.year = "   "
		@education.degree = "   "
		@education.major = "   "
		assert_not @education.valid?
	end
end
