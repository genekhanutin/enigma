require "pry"
class Rotator
	attr_reader :key, :offset

	def initialize(key = 0, offset = 0, message = "")
		@key     = key.to_s
		@offset  = offset.to_s
		@message = message
	end

	def self.encrypt(key, date_offset, message)
		encrypted = message.chars.each_slice(4).map do |slice|
			Rotator.new(key, date_offset, slice.join).encrypt
		end
		encrypted.join
	end

	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']
  end

	def rotation_value_generator
		encrypted_key = []
  	4.times do |iteration|
  		encrypted_key << key_encryptor(iteration, iteration+1)
  	end
  	encrypted_key
	end

	def decrypt
		rotation_vals = rotation_value_generator.map do |i|
			-i
		end
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)
	end

	def encrypt
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)
	end

	def rotation_a(rotation_values)
		first_character  = @message[0]
		result           = (character_map.index(first_character) + rotation_values[0]) % 39
		character_map[result].to_s
	end

	def rotation_b(rotation_values)
		if @message[1].nil?
			""
		else
			second_character = @message[1]
			result 					 = (character_map.index(second_character) + rotation_values[1]) % 39
			character_map[result].to_s
		end
	end

	def rotation_c(rotation_values)
		if @message[2].nil?
			""
		else
			third_character  = @message[2]
			result 			     = (character_map.index(third_character) + rotation_values[2]) % 39
			character_map[result].to_s
		end
	end

	def rotation_d(rotation_values)
		if @message[3].nil?
			""
		else
			fourth_character = @message[3]
			result 					 = (character_map.index(fourth_character) + rotation_values[3]) % 39
			character_map[result].to_s
		end
	end

	private

	def key_encryptor(first_index, second_index)
		key_pair_amount  = (key[first_index] + key[second_index]).to_i
  	offset_amount 	 = offset[first_index].to_i
  	key_pair_amount + offset_amount
	end
end


rotator = Rotator.new
rotator.character_map
