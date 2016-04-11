require 'pry'

class OffsetGenerator
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def offset
    doubled_date(@date).to_s[-4..-1].to_i
  end

  def doubled_date(date)
      date.to_i ** 2
  end
end
