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
	# print out array to hold on to key for decryption
end                                       # => :key_parser

# capture 5 digit sample with new variable
# take that array join the numbers
# then convert from string back to two digit integers
# by indexing the strings
# 

# key = Key.new  # => #<Key:0x007fe0b48068e8>

# key.key_parser(key_generator)  # ~> NameError: undefined local variable or method `key_generator' for main:Object
