class OffsetCalc
  attr_reader :date

  def initialize(date = Time.now.strftime("%m%d%y"))
    @date = date.to_i
  end

  def square_date
    date.to_i * date.to_i
  end

  def last_four_digits_of_squared_date
    offset = square_date.to_s[-4..-1].chars.map do |num|
      num
    end.join
  end
end
