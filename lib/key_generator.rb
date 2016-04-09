require 'pry'

class KeyGenerator
  def generate_key(key = nil)
     key = key || (0..4).collect{rand(0..9)}.join
  end
end

# If you have energy after file IO and crack,
# you may add test re given key == string and 5 chars
