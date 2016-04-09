require "./lib/encryptor"
require "./lib/decryptor"
# require "./lib/crack"


class Enigma
attr_reader :key, :date

  def encrypt(message, key=nil, date=Time.now.strftime("%d%m%y"))
    e = Encryptor.new(message, key, date)
    e.encrypt
    # call on write_encrypt_txt
  end

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
  def write_encrypt_txt
    content = File.read(ARGV[0])
    File.write(ARGV[1], content)
    puts "Created '#{encrypted.txt}'' with the key #{82648} and date #{030415}"
  end

  def decrypt(message, key=nil, date=Time.now.strftime("%d%m%y"))
    d = Decryptor.new(message, key, date)
    d.decrypt
  end

  # $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
  # puts "Created '#{decrypted.txt}'' with the key #{82648} and date #{030415}"

# ********switch to a new branch************
  # def crack(message, date)
  #   c = Crack.new(message, date)
  #   c.crack
  # end
  
  # $ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
  # "Created '#{cracked.txt}' with the cracked key #{82648} and date #{030415}"

end
