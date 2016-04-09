require 'minitest/autorun'
require 'minitest/pride'
require "./lib/encryptor"

class EncryptorTest < Minitest::Test

  def test_it_can_create_rotation_a
    message = "hello"
    encrypt = Encryptor.new(message, "12345", "030416")
    assert_equal 15, encrypt.rotation_a
  end

  def test_it_can_create_rotation_b
    message = "hello"
    encrypt = Encryptor.new(message, "12345", "030416")
    assert_equal 23, encrypt.rotation_b
  end

  def test_it_can_create_rotation_c
    message = "hello"
    encrypt = Encryptor.new(message, "12345", "030416")
    assert_equal 39, encrypt.rotation_c
  end

  def test_it_can_create_rotation_d
    message = "hello"
    encrypt = Encryptor.new(message, "12345", "030416")
    assert_equal 51, encrypt.rotation_d
  end

  def test_it_can_create_rotation_a_when_no_date_is_given
    message = "hello"
    encrypt = Encryptor.new(message, "12345")
    assert_equal 15, encrypt.rotation_a
  end

  def test_it_can_encrypt_a_message
    message = "hello"
    e = Encryptor.new(message, "12345", "030416")
    assert_equal "w1LX3", e.encrypt
  end

  def test_it_can_encrypt_a_message_when_no_date_is_given
    message = "hello"
    e = Encryptor.new(message, "12345", "030416")
    assert e.encrypt
  end
end
