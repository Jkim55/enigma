require 'pry'

class OffsetGenerator
  def generate_offset
    current_date = Time.now.strftime("%d%m%y")
    current_date_squared = current_date.to_i ** 2
    offset = current_date_squared.to_s[-4..-1].to_i
  end
end
