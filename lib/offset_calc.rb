class OffsetCalc
	attr_reader :date  # => nil

	def initialize(date = Time.now.strftime("%m%d%y"))
		@date = date.to_i                                  # => 30815
	end                                                 # => :initialize

	def square_date
		date.to_i * date.to_i  # => 949564225
	end                     # => :square_date

	def last_four_digits_of_squared_date
		offset = square_date.to_s[-4..-1].chars.map do |num|  # => ["4", "2", "2", "5"]
			num                                                  # => "4", "2", "2", "5"
		end.join                                              # => "4225"
	end                                                    # => :last_four_digits_of_squared_date
end                                                     # => :last_four_digits_of_squared_date

oc = OffsetCalc.new                  # => #<OffsetCalc:0x007fd60a0075e8 @date=30815>
oc.last_four_digits_of_squared_date  # => "4225"