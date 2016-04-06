require 'pry'

class KeyGenerator
  def generate_key
     key = (0..4).collect{rand(0..9)}
  end
end
