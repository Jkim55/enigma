require 'minitest/autorun'
require 'minitest/pride'
require "./lib/offset_generator"

class OffsetGeneratorTest < Minitest::Test
  def test_it_can_create_an_offset_without_a_date
    offset = OffsetGenerator.new
    assert_equal 3056, offset.date
  end

  def test_it_can_create_an_offset_when_a_date_is_given
    offset = OffsetGenerator.new("010409")
    assert_equal 7281, offset.date
  end

  def test_it_can_create_an_offset_when_a_different_date_is_given
    offset = OffsetGenerator.new("121904")
    assert_equal 5216, offset.date
  end

  def test_OffsetGenerator_return_a_4_digit_number
    offset = OffsetGenerator.new("121904")
    assert_equal 4, offset.date.to_s.length
  end

  def test_OffsetGenerator_return_a_fixnum
    offset = OffsetGenerator.new("121904")
    assert_equal Fixnum, offset.date.class
  end
end
