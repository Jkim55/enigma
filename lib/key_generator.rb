require 'pry'

class KeyGenerator
# generate a key of random numbers
# create an array w gen_key
  def generate_key
     key = (0..4).collect{rand(0..9)}
    #  key = rand(99999).to_s.rjust(5, "00000")
  end
end
