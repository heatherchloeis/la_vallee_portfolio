require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
	def setup
		@experience = Experience.new(company: "SNL",
															   year: "2012 - 2014",
															   title: "Lighting Artist",
															   location: "New York",
															   desc: "Lorem ipsum")
	end

	test "should be valid" do
		assert @experience.valid?
	end

	test "company, year, title, location, and desc should be present" do 
		@experience.company = "   "
		@experience.year = "   "
		@experience.title = "   "
		@experience.location = "   "
		@experience.desc = "   "
		assert_not @experience.valid?
	end

	test "should be shown most recent first" do
		assert_equal experiences(:two), Experience.first
	end
end
