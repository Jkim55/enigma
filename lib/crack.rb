require "./lib/key_generator"
require "./lib/offset_generator"
require "./lib/encryptor"
require "./lib/decryptor"
require "pry"

class Crack
  def initialize(message)
    @index = 0
    @message = message
  end

  def generate_all_possible_keys
    @key_val = (0..99999).map {|num| num.to_s.rjust(5,'0').split("").map(&:to_i)}
  end

  def pull_key_val
    @key = @key_val[@index]
    @index += 1
  end

  def generate_offset
    current_date = Time.now.strftime("%d%m%y")
    current_date_squared = current_date.to_i ** 2
    @offset = current_date_squared.to_s[-4..-1].to_i
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

  def crack_cipher(rotation)
    chars = ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    c_rotated_chars = chars.rotate(0 - rotation)
    c_rotated_pairs = Hash[chars.zip(c_rotated_chars)]
  end

  def crack
    cracked_chars_array = []
    @message.split("").each_slice(4){|chars|cracked_chars_array << chars}
    cracked_chars_array
    c_msg = []
    cracked_chars_array.each do |char|
      c_msg << crack_cipher(rotation_a)[char[0]]
      c_msg << crack_cipher(rotation_b)[char[1]]
      c_msg << crack_cipher(rotation_c)[char[2]]
      c_msg << crack_cipher(rotation_d)[char[3]]
    end
    c_msg.join
  end

  def cracking

  end
end


# But if we don't know the key, we can try to crack it with just the date:
# $ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
# Created 'cracked.txt' with the cracked key 82648 and date 030415
