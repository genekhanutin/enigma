class Key
	def key_generator
		numbers        = [1,2,3,4,5,6,7,8,9]           # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
		numbers_string = (numbers * 5).sample(5).join  # => "78439"
	end                                             # => :key_generator
end                                              # => :key_generator

key = Key.new.key_generator  # => "78439"


