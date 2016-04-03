require 'pry'

class Cipher
  attr_reader :rotated_pairs

  def initialize
    @rotated_pairs = {}
  end

  def rotate_chars(rotation)
    chars = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    rotated_chars = chars.rotate(rotation)
    @rotated_pairs = Hash[chars.zip(rotated_chars)]
  end

  def rotate_chars_extension(rotation)
    chars = ("a".."z").to_a + ("0".."9").to_a + (" .,!@#$%^&*()[],.<>;:/?\|").split("").to_a
    rotated_chars_extension = chars.rotate(rotation)
    Hash[chars.zip(rotated_chars)]
  end
end
