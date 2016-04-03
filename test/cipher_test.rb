require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/cipher"

class CipherTest < Minitest::Test
  def test_cipher_can_create_hash_with_rotation
    c = Cipher.new
    c.rotate_chars(2)
    assert_equal "c", c.rotated_pairs["a"]
  end

  def test_cipher_can_create_hash_with_rotation
    c = Cipher.new
    c.rotate_chars(10)
    assert_equal "k", c.rotated_pairs["a"]
  end
end
