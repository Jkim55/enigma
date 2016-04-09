require "./lib/encryptor"
require "./lib/decryptor"
# require "./lib/crack"


class Enigma

  def encrypt(message, key=nil, date=nil)
    e = Encryptor.new(message, key, date)
    e.encrypt
  end

  def decrypt(message, key=nil, date=nil)
    d = Decryptor.new(message, key, date)
    d.decrypt
  end

  # def crack(message, date)
  #   c = Crack.new(message, date)
  #   c.crack
  # end
end
