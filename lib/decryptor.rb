require "./lib/key_generator"
require "./lib/offset_generator"
require "pry"

class Decryptor
  attr_reader :message, :key, :date

  def initialize(file_path, decrypted_file, key, date)
    @file_path = file_path
    @decrypted_file = decrypted_file
    @date = OffsetGenerator.new(date).date
    @key = key
  end

  def read_message
    File.read(@file_path).chomp
  end

  def decrypt_message
      decrypt(read_message, key, date)
  end

  def write_message
    decrypted_file = File.open(@decrypted_file, 'w')
    decrypted_file.write(decrypt_message)
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
    chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    d_rotated_chars = chars.rotate(0 - rotation)
    d_rotated_pairs = Hash[chars.zip(d_rotated_chars)]
  end

  def decrypt(message, key, date = nil)
    puts "Created '#{@decrypted_file}' with the key #{@key} and date #{@date}"
    decrypted_chars_array = []
    message.chars.each_slice(4){|char|decrypted_chars_array << char}
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

if __FILE__ == $0
  file_path = ARGV[0]
  decrypted_file = ARGV[1]
  key = ARGV[2]
  date = ARGV[3]
  decrypt = Decryptor.new(file_path, decrypted_file, key, date)
  decrypt.write_message
end
