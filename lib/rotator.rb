require "pry"                   # => true
require_relative "key"          # ~> NoMethodError: undefined method `key_parser' for #<Key:0x007fd0f287adf0>
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
		encrypted = message.chars.each_slice(4).map do |slice|
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters
		end
		encrypted.join
	end

	def self.decrypt(key, date_offset, message)
		decrypted = message.chars.each_slice(4).map do |slice|
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
		# "41521"
		# [41,15,52,21]
		#"27519"
		#[27,75,51,19]                   # => [27, 75, 51, 19]

		encrypted_key = []
  	4.times do |iteration|
  		encrypted_key << key_encryptor(iteration, iteration + 1)
  	end
  	encrypted_key
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

key = Key.new.key_generator
offset = OffsetCalc.new.last_four_digits_of_squared_date
encrypted_message = Rotator.encrypt(key, offset, "hey mambo, mambo italiano")
Rotator.decrypt(key, 1225, encrypted_message)

# ~> NoMethodError
# ~> undefined method `key_parser' for #<Key:0x007fd0f287adf0>
# ~>
# ~> /Users/genekhanutin/home_work/enigma/lib/key.rb:18:in `<top (required)>'
# ~> /Users/genekhanutin/home_work/enigma/lib/rotator.rb:2:in `require_relative'
# ~> /Users/genekhanutin/home_work/enigma/lib/rotator.rb:2:in `<main>'



