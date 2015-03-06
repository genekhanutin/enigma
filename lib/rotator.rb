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

	# encryptor calls "key" for a key, offset_calc for an offset (maybe just call rotator for all info)
	# then pass them and a message to rotator who will combine and reassign
	# the key and offset and rotate the message by that sum

	def character_map
		character_map = [*('a'..'z'), *(0..9), ' ', '.', ',']
  end

	def calculate_key_offset_sum
  	4.times.map do |i|
  		first_index    = i
  		second_index   = i + 1

  		key_element    = (key[first_index] + key[second_index]).to_i
  		offset_element = offset[first_index].to_i

  		key_element + offset_element 
  	end
	end

	def rotation_a(calculated_key_offset_sum)
		calculate_key_offset_sum = calculated_key_offset_sum
		first_character = @message[0]
		result = (character_map.index(first_character) + calculate_key_offset_sum[0]) % 39
		character_map[result].to_s
	end

	def rotation_b(calculated_key_offset_sum)
		calculate_key_offset_sum = calculated_key_offset_sum
		second_character = @message[1]
		result = (character_map.index(second_character) + calculate_key_offset_sum[1]) % 39
		character_map[result].to_s
	end

	def rotation_c(calculated_key_offset_sum)
		calculate_key_offset_sum = calculated_key_offset_sum
		third_character = @message[2]
		result = (character_map.index(third_character) + calculate_key_offset_sum[2]) % 39
		character_map[result].to_s
	end

	def rotation_d(calculated_key_offset_sum)
		calculate_key_offset_sum = calculated_key_offset_sum
		fourth_character = @message[3]
		result = (character_map.index(fourth_character) + calculate_key_offset_sum[3]) % 39
		character_map[result].to_s
	end
end

# ((index of original letter) + rotation + offset) % character_map.size`

rotator = Rotator.new
rotator.character_map

# sum_of_key_and_offset will be total number of times 
# a,b,c,d rotate each character in text
# text 

# this 							message is about a bomb
# [27,30,40,50]






