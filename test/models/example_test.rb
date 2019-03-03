require 'test_helper'

class ExampleTest < ActiveSupport::TestCase
	def setup
		@example = Example.new(title: "Jane",
													 category: "image")
	end

	test "should be valid" do
		assert @example.valid?
	end

	test "school, year, degree, and major should be present" do 
		@example.title = "   "
		@example.category = "   "
		assert_not @example.valid?
	end

	test "should be shown most recent first" do
		assert_equal examples(:two), Example.first
	end
end
