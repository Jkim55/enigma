require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"



class CrackTest < Minitest::Test
  def test_it_can_crack_message
    #key = 00005 date=090416
    message = "keqwr 1zuliIB.jyg.D"
    crack = Crack.new(message)
    assert_equal "00005", crack.crack
  end


end
