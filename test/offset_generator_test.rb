require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/offset_generator"

class OffsetGeneratorTest < Minitest::Test
  def test_it_can_create_an_offset_without_a_date
    offset_generator = OffsetGenerator.new
    assert_equal 3056, offset_generator.offset
  end

  def test_it_can_create_an_offset_when_a_date_is_given
    offset_generator = OffsetGenerator.new("010409")
    assert_equal 7281, offset_generator.offset
  end

  def test_it_can_create_an_offset_when_a_different_date_is_given
    offset_generator = OffsetGenerator.new("121904")
    assert_equal 5216, offset_generator.offset
  end

  def test_OffsetGenerator_return_a_4_digit_number
    offset_generator = OffsetGenerator.new("121904")
    assert_equal 4, offset_generator.offset.to_s.length
  end

  def test_OffsetGenerator_return_a_fixnum
    offset_generator = OffsetGenerator.new("121904")
    assert_equal Fixnum, offset_generator.offset.class
  end
end
