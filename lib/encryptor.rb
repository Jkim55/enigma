require_relative "key_generator"
require_relative "offset_generator"
require "pry"

class Encryptor
  def initialize(key, offset, message=nil)
    @key = key
    @offset = offset
    @message = message
  end

  def rotation_a
    @key.to_s[0..1].to_i + @offset.to_s[0].to_i
  end

  def rotation_b
    @key.to_s[1..2].to_i + @offset.to_s[1].to_i
  end

  def rotation_c
    @key.to_s[2..3].to_i + @offset.to_s[2].to_i
  end

  def rotation_d
    @key.to_s[3..4].to_i + @offset.to_s[3].to_i
  end

  def encrypt_cipher(rotation)
    chars = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    rotated_chars = chars.rotate(rotation)
    rotated_pairs = Hash[chars.zip(rotated_chars)]
  end

  def encrypt
    chars_array = []
    @message.split("").each_slice(4){|chars|chars_array << chars}
    # chars_array
    e_message = []
    chars_array.each do |char|
      e_message << encrypt_cipher(rotation_a)[char[0]]
      e_message << encrypt_cipher(rotation_b)[char[1]]
      e_message << encrypt_cipher(rotation_c)[char[2]]
      e_message << encrypt_cipher(rotation_d)[char[3]]
    end
    e_message.join
  end

  # def encrypt_file(filename, rotation) # get command line working
  #   input = File.open(filename, 'r')
  #   open_file = input.read
  #   encrypted_text = self.encrypt(open_file, rotation)
  #   encrypted_name = filename + ".encrypted"     # why isn't the extension to this .txt
  #   output = File.open(encrypted_name, 'w')
  #   output.write(encrypted_text)
  #   output.close
  # end
end
