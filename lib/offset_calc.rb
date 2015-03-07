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


# Time.now.strftime("%m%d%y").to_i

#oc = OffsetCalc.new(122315)          # => #<OffsetCalc:0x007fc255007570 @date=122315>
#oc.last_four_digits_of_squared_date  # => [9, 2, 2, 5]

oc = OffsetCalc.new

oc.last_four_digits_of_squared_date
