require 'minitest/autorun'
require 'minitest/pride'
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt_a_message
    message = "hello"
    eg = Enigma.new
    assert_equal "*IDX<", eg.encrypt(message, "12345", "030416")
  end

  def test_it_can_decrypt_a_message
    message = "*IDX<"
    dg = Enigma.new
    assert_equal "hello", dg.decrypt(message, "12345", "030416")
  end

  def test_it_can_encrypt_a_message
    message = "Olive is a cat who lives in DTC"
    eg2 = Enigma.new
    assert_equal "LRDIbqDF7Gf2XZfJeUf.fb,F7OIXA,k", eg2.encrypt(message, "54321", "100615")
  end

  def test_it_can_decrypt_a_message
    message = "LRDIbqDF7Gf2XZfJeUf.fb,F7OIXA,k"
    dg = Enigma.new
    assert_equal "Olive is a cat who lives in DTC", dg.decrypt(message, "54321", "100615")
  end


end
