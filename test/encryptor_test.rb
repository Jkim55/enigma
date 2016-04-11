require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/encryptor"

class EncryptorTest < Minitest::Test
  attr_accessor :file_path

  def setup
    self.file_path = File.expand_path'../../lib/test.txt',__FILE__
    @filename = 'test.txt'
    @encrypted_file = 'test_encrypted.txt'
    @encrypt = Encryptor.new(@file_path, @encrypted_file)
  end

  def test_encryptor_is_initialized_with_certain_parameters
    assert Encryptor.new(@file_path, "test_encrypted.txt")
  end

  def test_it_can_read_a_file
    assert_equal "hello there", @encrypt.read_message
  end

  def test_it_can_write_the_encrypted_message_to_a_different_file
    @encrypt = Encryptor.new(@file_path, "test_encrypted.txt")
    message = File.read(@file_path)
    key = "12345"
    date = "030416"
    assert_equal 11, @encrypt.encrypt(message, key, date).length
  end
end
