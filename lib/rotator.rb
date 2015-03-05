class Rotator
	attr_reader :key, :offset

	def initialize(key = 0, offset = 0, message = "")
		@key     = key.to_s
		@offset  = offset.to_s
		@message = message
		#self.run
	end

	# def	run
	# 	rotate_by(calculate_key_offset_sum
	# end

	# encryptor calls key for a key, offset_calc for an offset
	# then pass them and a message to rotator who will combine and reassign
	# the key and offset and rotate the message by that sum

	def character_map
		character_map = [*('a'..'z'), *(0..9), ' ', '.', ',']
	end

	def calculate_key_offset_sum
  	4.times.map do |i|
  		first_index  = i
  		second_index = i + 1

  		key_element    = (key[first_index] + key[second_index]).to_i
  		offset_element = offset[first_index].to_i

  		key_element + offset_element 
  	end
	end

	def rotate_by(calculated_key_offset_sum)
		a,b,c,d = calculated_key_offset_sum 
	end

end

rotator = Rotator.new
rotator.character_map

# sum_of_key_and_offset will be total number of times 
# a,b,c,d rotate each character in text
# text 

# this message is about a bomb
# abcdabcdabcdabcdabcdabcdabcd