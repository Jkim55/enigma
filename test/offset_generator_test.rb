require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/offset_generator"

class OffsetGeneratorTest < Minitest::Test
  def test_it_can_create_an_offset
    offset = OffsetGenerator.new
    assert_equal 3056, offset.generate_offset
  end
end
