class Key
	def key_generator
		numbers        = [1,2,3,4,5,6,7,8,9]           # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
		numbers_string = (numbers * 5).sample(5).join  # => "34822"
	end                                             # => :key_generator
end                                              # => :key_generator

key = Key.new.key_generator  # => "34822"


