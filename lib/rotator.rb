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

	def rotation_value_generator
		encrypted_key = []
  	4.times do |iteration|
  		encrypted_key << key_encryptor(iteration, iteration+1)
  	end
  	encrypted_key
	end

	def bigg_ass_method
		# this might call encrypt
	end

	def encrypt
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)
	end

	def rotation_a(rotation_values)
		first_character = @message[0]
		result = (character_map.index(first_character) + rotation_values[0]) % 39
		character_map[result].to_s
	end

	def rotation_b(rotation_values)
		second_character = @message[1]
		result = (character_map.index(second_character) + rotation_values[1]) % 39
		character_map[result].to_s
	end

	def rotation_c(rotation_values)
		third_character = @message[2]
		result = (character_map.index(third_character) + rotation_values[2]) % 39
		character_map[result].to_s
	end

	def rotation_d(rotation_values)
		fourth_character = @message[3]
		result = (character_map.index(fourth_character) + rotation_values[3]) % 39
		character_map[result].to_s
	end

	private

	def key_encryptor(first_index, second_index)
		key_pair_amount    	 = (key[first_index] + key[second_index]).to_i
  	offset_amount 			 = offset[first_index].to_i
  	key_pair_amount + offset_amount
	end
end



rotator = Rotator.new
rotator.character_map

# sum_of_key_and_offset will be total number of times 
# a,b,c,d rotate each character in text
# text 

# this 							message is about a bomb
# [27,30,40,50]






