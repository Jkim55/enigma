require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"



class CrackTest < Minitest::Test

  def test_it_can_crack_message
    message = "u2hs1vsv49,elwauqw7"
    offset = 3056
    crack = Crack.new

    assert_equal "Hello World..end..", crack.cracking(message)
  end


end
