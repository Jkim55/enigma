require 'minitest/autorun'
require 'minitest/pride'
require "./lib/encryptor"

class EncryptorTest < Minitest::Test
  def test_it_can_create_rotation_a
    encrypt = Encryptor.new(12345, 1111)
    assert_equal 13, encrypt.rotation_a
  end

  def test_it_can_create_rotation_b
    encrypt = Encryptor.new(12345, 1111)
    assert_equal 24, encrypt.rotation_b
  end

  def test_it_can_create_rotation_c
    encrypt = Encryptor.new(12345, 1111)
    assert_equal 35, encrypt.rotation_c
  end

  def test_it_can_create_rotation_d
    encrypt = Encryptor.new(12345, 1111)
    assert_equal 46, encrypt.rotation_d
  end

  def test_can_create_a_nest_array_of_characters
    skip
    message = "Test it"
    encrypted_string = Encryptor.new(12345, 1111, message)
    assert_equal [["T", "e", "s", "t"], [" ", "i", "t"]], encrypted_string.encrypt
  end

  def test_it_can_encrypt_a_message
    d = Encryptor.new(12345, 1111, "hello")
    assert_equal "u2hs1", d.encrypt
  end

  # Do I want to write more tests? If so, what tests?
end
