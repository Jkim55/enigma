require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"



class CrackTest < Minitest::Test
  # def test_it_can_create_rotation_a
  #   message = "w1lx3"
  #   d_msg = Decryptor.new(message, "12345", "030416")
  #   assert_equal 15, d_msg.rotation_a
  # end
  #
  # def test_it_can_create_rotation_b
  #   message = "w1lx3"
  #   d_msg = Decryptor.new(message, "12345", "030416")
  #   assert_equal 23, d_msg.rotation_b
  # end
  #
  # def test_it_can_create_rotation_c
  #   message = "w1lx3"
  #   d_msg = Decryptor.new(message, "12345", "030416")
  #   assert_equal 39, d_msg.rotation_c
  # end
  #
  # def test_it_can_create_rotation_d
  #   message = "w1lx3"
  #   d_msg = Decryptor.new(message, "12345", "030416")
  #   assert_equal 51, d_msg.rotation_d
  # end
  #
  # def test_it_can_create_rotation_a_when_no_date_is_given
  #   message = "hello"
  #   decrypt = Decryptor.new(message, "12345")
  #   assert_equal 15, decrypt.rotation_a
  # end

  def test_it_can_crack_message_when_date_is_given
    #key = 00011 date = 271114
    message = "bwvm0xFJnwkJH"
    crack = Crack.new(message, "271114")
    assert_equal "00011", crack.crack
  end

  def test_it_can_crack_another_message_when_date_is_given
    #key = 00007 date = 150410
    message = "avplz.SLKSEaFnez0bglG,eul,."
    crack = Crack.new(message, "150410")
    assert_equal "00007", crack.crack
  end

  def test_it_can_crack_message_when_no_date_is_given
    #key = 00005 date=090416
    message = "keqwr 1zuliIB.jyg.D"
    crack = Crack.new(message)
    assert_equal "00005", crack.crack
  end

  def test_it_can_crack_another_message_when_no_date_is_given
    #key = 00003 date=090416
    message = "JotmeyjIAwt0odDHhniHB"
    crack = Crack.new(message)
    assert_equal "00003", crack.crack
  end
end
