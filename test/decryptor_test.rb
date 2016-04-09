require 'minitest/autorun'
require 'minitest/pride'
require "./lib/decryptor"

class DecryptorTest < Minitest::Test
  def test_it_can_create_rotation_a
    message = "w1lx3"
    d_msg = Decryptor.new(message, "12345", "030416")
    assert_equal 15, d_msg.rotation_a
  end

  def test_it_can_create_rotation_b
    message = "w1lx3"
    d_msg = Decryptor.new(message, "12345", "030416")
    assert_equal 23, d_msg.rotation_b
  end

  def test_it_can_create_rotation_c
    message = "w1lx3"
    d_msg = Decryptor.new(message, "12345", "030416")
    assert_equal 39, d_msg.rotation_c
  end

  def test_it_can_create_rotation_d
    message = "w1lx3"
    d_msg = Decryptor.new(message, "12345", "030416")
    assert_equal 51, d_msg.rotation_d
  end

  def test_it_can_create_rotation_a_when_no_date_is_given
    message = "hello"
    decrypt = Decryptor.new(message, "12345")
    assert_equal 15, decrypt.rotation_a
  end

  def test_it_can_decrypt_a_message
    message = "w1LX3"
    d = Decryptor.new(message, "12345", "030416")
    assert_equal "hello", d.decrypt
  end

  def test_it_can_decrypt_a_message_when_no_date_is_given
    message = "w1LX3"
    d = Decryptor.new(message, "12345")
    assert d.decrypt
  end
end
