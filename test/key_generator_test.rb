require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/key_generator"

class KeyGeneratorTest < Minitest::Test
  def test_it_can_create_a_new_key_when_no_key_is_given
    key = KeyGenerator.new
    assert key.generate_key
  end

  def test_it_can_create_a_new_key_when_key_is_given
    key = KeyGenerator.new
    assert_equal "12345", key.generate_key("12345")
  end

  def test_given_key_must_be_5_characters_in_length
    key = KeyGenerator.new
    assert_equal 5, key.generate_key("12345").length
  end

  def test_given_key_must_be_string
    key = KeyGenerator.new
    assert_equal String, key.generate_key("12345").class
  end
end
