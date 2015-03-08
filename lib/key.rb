class Key
	def key_generator
		numbers        = [1,2,3,4,5,6,7,8,9]
		numbers_string = (numbers * 5).sample(5).join
	end
end

key = Key.new.key_generator


