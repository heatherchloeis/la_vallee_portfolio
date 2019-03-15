require 'test_helper'

class ExampleTest < ActiveSupport::TestCase
	def setup
		@example = Example.new(style: "grid-item-wide",
													 category: "image")
	end

	test "should be valid" do
		assert @example.valid?
	end

	test "category should be present" do 
		@example.category = "   "
		assert_not @example.valid?
	end

	test "should attach image/video" do
		@example.content.attach(io: File.open(fixture_path + 'example_image.png'), 
														filename: '',
														content_type: 'image/png')
		assert @example.content.attached?
	end

	test "should be shown most recent first" do
		assert_equal examples(:two), Example.first
	end
end
