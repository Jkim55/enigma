require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/decryptor"

class DecryptorTest < Minitest::Test
attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/test_encrypted.txt',__FILE__
    @filename = 'test_encrypted.txt'
    @decrypted_file = 'test_decrypted.txt'
    @key = "12345"
    @date = "030416"
    @decrypt = Decryptor.new(@file_path, @decrypted_file, @key, @date)
  end

  def test_decryptor_is_initialized_with_certain_parameters
    assert @decrypt
  end

  def test_it_can_read_a_file
    assert_equal "w1LX3", @decrypt.read_message
  end

  def test_it_can_decrypt_a_message
    assert_equal 5, @decrypt.decrypt_message.length
  end

  def test_it_can_write_the_decrypted_message_to_a_different_file
    @decrypt = Decryptor.new(@file_path, "test_decrypted.txt", @key, @date)
    assert_equal 5, @decrypt.write_message
  end

  # def test_it_can_decrypt_a_message
  #   message = "hello"
  #   d = Decryptor.new(message, "12345", "030416")
  #   assert_equal "hello", d.decrypt
  # end

  # def test_it_can_decrypt_a_message_when_no_date_is_given
  #   message = "w1LX3"
  #   d = Decryptor.new(message, "12345")
  #   assert d.decrypt
  # end
end
