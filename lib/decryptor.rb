require "./lib/key_generator"
require "./lib/offset_generator"
require "pry"

class Decryptor
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @key = key || KeyGenerator.new.generate_key(key)
    @date = OffsetGenerator.new(date).date
    @message = message
  end

  def rotation_a
    key.to_s[0..1].to_i + date.to_s[0].to_i
  end

  def rotation_b
    key.to_s[1..2].to_i + date.to_s[1].to_i
  end

  def rotation_c
    key.to_s[2..3].to_i + date.to_s[2].to_i
  end

  def rotation_d
    key.to_s[3..4].to_i + date.to_s[3].to_i
  end

  def decrypt_cipher(rotation)
    chars = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    d_rotated_chars = chars.rotate(0 - rotation)
    d_rotated_pairs = Hash[chars.zip(d_rotated_chars)]
  end

  def decrypt
    decrypted_chars_array = []
    message.chars.each_slice(4){|chars|decrypted_chars_array << chars}
    decrypted_chars_array
    d_msg = []
    decrypted_chars_array.each do |char|
      d_msg << decrypt_cipher(rotation_a)[char[0]]
      d_msg << decrypt_cipher(rotation_b)[char[1]]
      d_msg << decrypt_cipher(rotation_c)[char[2]]
      d_msg << decrypt_cipher(rotation_d)[char[3]]
    end
    d_msg.join
  end
end
