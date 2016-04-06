require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/decryptor"

class EncryptorTest < Minitest::Test
  def test_it_can_create_rotation_a
    d_msg = Encryptor.new(12345, 1111)
    assert_equal 13, d_msg.rotation_a
  end

  def test_it_can_create_rotation_b
    d_msg = Encryptor.new(12345, 1111)
    assert_equal 24, d_msg.rotation_b
  end

  def test_it_can_create_rotation_c
    d_msg = Encryptor.new(12345, 1111)
    assert_equal 35, d_msg.rotation_c
  end

  def test_it_can_create_rotation_d
    d_msg = Encryptor.new(12345, 1111)
    assert_equal 46, d_msg.rotation_d
  end

  def test_can_create_a_nest_array_of_characters
    skip
    message = "u2hs1"
    decrypted_string = Decryptor.new(12345, 1111, message)
    assert_equal [["u", "2", "h", "s"], ["1"]], decrypted_string.decrypt
  end

  def test_it_can_decrypt_a_message
    d = Decryptor.new(12345, 1111, "u2hs1")
    assert_equal "hello", d.decrypt
  end

# Do I want to write more tests? If so, what tests?

end
