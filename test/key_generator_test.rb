require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/key_generator"

class KeyGeneratorTest < Minitest::Test
  def test_it_can_create_a_new_key
    key = KeyGenerator.new
    assert key.generate_key
  end
end
