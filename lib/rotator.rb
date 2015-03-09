require "pry"
require_relative "key"
require_relative "offset_calc"

class Rotator
	attr_reader :key, :offset

	def initialize(key = 0, offset = 0, message = "")
		key
		@key     = key.to_s
		@offset  = offset.to_s
		@message = message
	end

	def self.encrypt(key, date_offset, message)
		
		encrypted = message.each_char.each_slice(4).map do |slice|
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters
		end
		encrypted.join
	end

	def self.decrypt(key, date_offset, message)
		decrypted = message.each_char.each_slice(4).map do |slice|
			Rotator.new(key, date_offset, slice.join).combine_decrypted_characters
		end
		decrypted.join
	end

	def combine_encrypted_characters
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)
	end

	def combine_decrypted_characters
		rotation_vals = rotation_value_generator.map do |i|
			-i
		end
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)
	end
	
	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']
  end

	def rotation_value_generator
		encryption_key = []
  	4.times do |iteration|
  		encryption_key << key_encryptor(iteration, iteration + 1)
  	end
  	encryption_key
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

# key = Key.new                                                                                                                                                                                                                  # => #<Key:0x007f85090f3210>
# key.key_generator                                                                                                                                                                                                              # => "78942"
# oc = OffsetCalc.new                                                                                                                                                                                                            # => #<OffsetCalc:0x007f85090f2a68 @date=30915>
# oc.last_four_digits_of_squared_date                                                                                                                                                                                            # => "7225"
# encrypted = Rotator.encrypt(key.key_generator, oc.last_four_digits_of_squared_date, "this is a secret message, dont tell anyone about it or you will face serious consequences. you will have to attend turing for 7 months")  # => "bl1tsm..vb.fxvxusqxtaezfubwp8xquzp4.vrep8iqbwsausm,.9vqz9yqx3p4.0evfswxs3satsg7oai9vzrvfacqz9yqx3p4.2ebfsx7.vx,f8hqucv1o1byp,bn.7s6u2w"


