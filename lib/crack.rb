require "./lib/key_generator"
require "./lib/offset_generator"
require "./lib/encryptor"
require "./lib/decryptor"
require "pry"


class Crack
  attr_reader :file_path, :crack_file, :date

  def initialize(file_path, crack_file, date = Time.now.strftime("%d%m%y"))
    @file_path = file_path
    @index = 0
    @crack_file = crack_file
    @date = OffsetGenerator.new(date).date
  end

    def read_message
      File.read(@file_path).chomp
    end

    def crack_message
      crack(read_message, date)
    end
# 
    def write_message
      crack_file = File.open(@crack_file, 'w')
      crack_file.write(crack_message)
    end

  def generate_all_possible_keys
    @key_val = (0..99999).map {|num| num.to_s.rjust(5,'0').chars.map(&:to_i)}
  end

  def pull_key_val
    generate_all_possible_keys
    @key = @key_val[@index].join
    @index += 1
  end

  def generate_offset
    current_date = Time.now.strftime("%d%m%y")
    current_date_squared = current_date.to_i ** 2
    date = current_date_squared.to_s[-4..-1].to_i
  end

  def rotation_a
    @key.to_s[0..1].to_i + @date.to_s[0].to_i
  end

  def rotation_b
    @key.to_s[1..2].to_i + @date.to_s[1].to_i
  end

  def rotation_c
    @key.to_s[2..3].to_i + @date.to_s[2].to_i
  end

  def rotation_d
    @key.to_s[3..4].to_i + @date.to_s[3].to_i
  end

  def crack_cipher(rotation)
    chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a + (" .,").chars
    c_rotated_chars = chars.rotate(0 - rotation)
    c_rotated_pairs = Hash[chars.zip(c_rotated_chars)]
  end

  def crack(message, date)
    key_found = false

    until key_found == true
      cracked_chars_array = []
      message.chars.each_slice(4){|char|cracked_chars_array << char}
      cracked_chars_array
      c_msg = []
      cracked_chars_array.each do |char|
        c_msg << crack_cipher(rotation_a)[char[0]]
        c_msg << crack_cipher(rotation_b)[char[1]]
        c_msg << crack_cipher(rotation_c)[char[2]]
        c_msg << crack_cipher(rotation_d)[char[3]]
      end

        if c_msg.join.include?("..end..")

          key_found = true
          puts c_msg.join
          return @key
        else
          pull_key_val
          generate_offset
          rotation_a
          rotation_b
          rotation_c
          rotation_d
        end
    end
    puts "Created '#{@crack_file}' with cracked key #{@key} and date #{@date}"
  end
end

if __FILE__ == $0
  file_path = ARGV[0]
  crack_file = ARGV[1]
  date = ARGV[2]
  crack = Crack.new(file_path, crack_file, date)
  crack.write_message
end
