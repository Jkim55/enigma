require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"

class CrackTest < Minitest::Test
  attr_accessor :file_path

  def setup
  end

  def test_it_can_crack_message
    self.file_path = File.expand_path'../../lib/test_encrypted2.txt',__FILE__
    @filename = 'test_encrypted2.txt'
    @crack_file = 'test_crack.txt'
    @date = "100416"
    @crack = Crack.new(@file_path, @crack_file, @date)

    assert_equal "00005", @crack.crack_message
  end

  def test_it_can_crack_another_message
    self.file_path = File.expand_path'../../lib/test_encrypted3.txt',__FILE__
    @filename = 'test_encrypted3.txt'
    @crack_file = 'test_crack.txt'
    @date = "100416"
    @crack = Crack.new(@file_path, @crack_file, @date)

    assert_equal "00011", @crack.crack_message
  end
end
