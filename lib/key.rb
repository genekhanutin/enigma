class Key
	def key_generator
		numbers        = [0,1,2,3,4,5,6,7,8,9]
		numbers_string = (numbers * 5).sample(5).join
	end                                             # => :key_generator

	def key_parser
		key_string     = key_generator
		paired_digits  = []

		paired_digits << key_string[0..1].to_i
		paired_digits << key_string[1..2].to_i
		paired_digits << key_string[2..3].to_i
		paired_digits << key_string[3..4].to_i
		paired_digits
	end                                      # => :key_parser
end                                       # => :key_parser


