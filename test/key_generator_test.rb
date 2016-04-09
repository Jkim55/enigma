require 'minitest/autorun'
require 'minitest/pride'
require "./lib/key_generator"

class KeyGeneratorTest < Minitest::Test
  def test_it_can_create_a_new_key
    key = KeyGenerator.new
    assert key.generate_key
  end

# Do I want to write more tests? If so, what tests?
end
