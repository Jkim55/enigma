require "./lib/key_generator"
require "./lib/offset_generator"
require "pry"

class Encryptor
  attr_reader :message, :key, :date

  def initialize(file_path, encrypted_file)
    @file_path = file_path
    @encrypted_file = encrypted_file
    @message = message
  end

  def read_message
    File.read(@file_path).chomp
  end

  def encrypt_message
      encrypt(read_message, key, date)
  end

  def write_message
    encrypted_file = File.open(@encrypted_file, 'w')
    encrypted_file.write(encrypt_message)
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

  def encrypt_cipher(rotation)
    chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    rotated_chars = chars.rotate(rotation)
    rotated_pairs = Hash[chars.zip(rotated_chars)]
  end

  def encrypt(message, key = nil, date = nil)
    @key = key || KeyGenerator.new.generate_key
    @date = date || OffsetGenerator.new.date
    puts "Created '#{@encrypted_file}' with the key #{@key} and date #{@date}"
    chars_array = []
    message.chars.each_slice(4){|char|chars_array << char}
    e_message = []
    chars_array.each do |char|
      e_message << encrypt_cipher(rotation_a)[char[0]]
      e_message << encrypt_cipher(rotation_b)[char[1]]
      e_message << encrypt_cipher(rotation_c)[char[2]]
      e_message << encrypt_cipher(rotation_d)[char[3]]
    end
    e_message.join
  end
end

if __FILE__ == $0
file_path = ARGV[0]
encrypted_file = ARGV[1]
encrypt = Encryptor.new(file_path, encrypted_file)
encrypt.write_message
end
