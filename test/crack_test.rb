require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"

class CrackTest < Minitest::Test
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

  def test_it_can_crack_message_when_date_is_not_given
    #key = 00005 date=090416
    message = "keqwr 1zuliIB.jyg.D"
    crack = Crack.new(message)
    assert_equal "00005", crack.crack
  end

  def test_it_can_crack_another_message_when_date_is_not_given
    #key = 00003 date=090416
    message = "JotmeyjIAwt0odDHhniHB"
    crack = Crack.new(message)
    assert_equal "00003", crack.crack
  end
end
