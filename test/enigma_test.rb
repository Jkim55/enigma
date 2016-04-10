require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt_a_message_when_date_is_given
    message = "Olive is a cat who lives in DTC"
    eg2 = Enigma.new
    assert_equal "LRDIbqDF7Gf2XZfJeUf.fb,F7OIXA,k", eg2.encrypt(message, "54321", "100615")
  end

  def test_it_can_decrypt_a_message_when_date_is_given
    message = "LRDIbqDF7Gf2XZfJeUf.fb,F7OIXA,k"
    dg = Enigma.new
    assert_equal "Olive is a cat who lives in DTC", dg.decrypt(message, "54321", "100615")
  end

  def test_it_can_encrypt_a_message_when_date_is_not_given
    message = "hello there"
    eg = Enigma.new
    assert_equal "w1LX3UTTtBE", eg.encrypt(message, "12345", "090416")
  end

  def test_it_can_decrypt_a_message_when_date_is_not_given
    message = "w1LX3UTTtBE"
    dg = Enigma.new
    assert_equal "hello there", dg.decrypt(message, "12345", "090416")
  end

  def test_it_can_crack_a_message_when_date_is_given
    message = "Jevv0,q12,qmGyqytAAlwfAF"
    c = Enigma.new
    assert_equal "00002", c.crack(message, "120315")
  end

  def test_it_can_crack_a_message_when_a_date_is_not_given
    # today's date = 090416
    message = "Fhq2h n1AtmsAAk7hrs2rnDMhniMB"
    c = Enigma.new
    assert_equal "00008", c.crack(message)
  end
end
