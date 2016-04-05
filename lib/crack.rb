require_relative "key_generator"
require_relative "offset_generator"
require_relative "encryptor"
require_relative "decryptor"
require "pry"

class Crack
  def cracking(message, offset)
    arr_key_val = (0..100).to_a
    key_val = arr_key_val.map {|num| num.to_s.rjust(5, '00000')}
    # go through each indexxx of key_val array
    #   for each offset...spin message
    #
    #   when msg[-7, -1]== ..end..
    binding.pry




  end
  # key abcd = generated from all possible 5 digit key values btwen 00000 - 99999
  # Until cracked string includes "..end.." run all possibilities of every key
    # generate keys - add offset
    # try out rotation
  # When correct rotation found = return the key
end


# But if we don't know the key, we can try to crack it with just the date:
# $ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
# Created 'cracked.txt' with the cracked key 82648 and date 030415
