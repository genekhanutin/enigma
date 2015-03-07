class Key
	def key_generator
		numbers        = [1,2,3,4,5,6,7,8,9]           # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
		numbers_string = (numbers * 5).sample(5).join  # => "48813"
	end                                             # => :key_generator
	# def key_parser
	# 	key_generator                 # => "27519"
	# 	# paired_digits  = []                            # => []

	# 	# paired_digits << key_string[0..1].to_i  # => [27]
	# 	# paired_digits << key_string[1..2].to_i  # => [27, 75]
	# 	# paired_digits << key_string[2..3].to_i  # => [27, 75, 51]
	# 	# paired_digits << key_string[3..4].to_i  # => [27, 75, 51, 19]
	# 	# paired_digits      
	# end                                      # => :key_parser
end  # => :key_generator

key = Key.new.key_generator  # => "48813"

#key.key_parser  # => [77, 77, 73, 34]

