require "pry"                   # => true
require_relative "key"          # => true
require_relative "offset_calc"  # => true

class Rotator
	attr_reader :key, :offset  # => nil

	def initialize(key = 0, offset = 0, message = "")
		key                                               # => "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538"
		@key     = key.to_s                               # => "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538", "73538"
		@offset  = offset.to_s                            # => "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225"
		@message = message                                # => "this", " is ", "a hu", "ge s", "ecre", "t", "vfyw", ",g8b", "c8xy", "icnw", "ga7i", "v"
	end                                                # => :initialize

	def self.encrypt(key, date_offset, message)
		encrypted = message.each_char.each_slice(4).map do |slice|               # => #<Enumerator: #<Enumerator: "this is a huge secret":each_char>:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters  # => "vfyw", ",g8b", "c8xy", "icnw", "ga7i", "v"
		end                                                                      # => ["vfyw", ",g8b", "c8xy", "icnw", "ga7i", "v"]
		encrypted.join                                                           # => "vfyw,g8bc8xyicnwga7iv"
	end                                                                       # => :encrypt

	def self.decrypt(key, date_offset, message)
		decrypted = message.each_char.each_slice(4).map do |slice|               # => #<Enumerator: #<Enumerator: "vfyw,g8bc8xyicnwga7iv":each_char>:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_decrypted_characters  # => "this", " is ", "a hu", "ge s", "ecre", "t"
		end                                                                      # => ["this", " is ", "a hu", "ge s", "ecre", "t"]
		decrypted.join                                                           # => "this is a huge secret"
	end                                                                       # => :decrypt

	def combine_encrypted_characters
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)  # => "vfyw", ",g8b", "c8xy", "icnw", "ga7i", "v"
	end                                                                                                                                                         # => :combine_encrypted_characters

	def combine_decrypted_characters
		rotation_vals = rotation_value_generator.map do |i|                                                            # => [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43]
			-i                                                                                                            # => -80, -37, -55, -43, -80, -37, -55, -43, -80, -37, -55, -43, -80, -37, -55, -43, -80, -37, -55, -43, -80, -37, -55, -43
		end                                                                                                            # => [-80, -37, -55, -43], [-80, -37, -55, -43], [-80, -37, -55, -43], [-80, -37, -55, -43], [-80, -37, -55, -43], [-80, -37, -55, -43]
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)  # => "this", " is ", "a hu", "ge s", "ecre", "t"
	end                                                                                                             # => :combine_decrypted_characters
	
	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "...
  end                                                        # => :character_map

	def rotation_value_generator
		encryption_key = []                                          # => [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
  	4.times do |iteration|                                      # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
  		encryption_key << key_encryptor(iteration, iteration + 1)  # => [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43], [80], [80, 37], [80, 37, 55], [80, 37, 55, 43...
  	end                                                         # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
  	encryption_key                                              # => [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43], [80, 37, 55, 43...
	end                                                           # => :rotation_value_generator

	def rotation_a(rotation_values)
			first_character  = @message[0]                                                       # => "t", " ", "a", "g", "e", "t", "v", ",", "c", "i", "g", "v"
			result           = (character_map.index(first_character) + rotation_values[0]) % 39  # => 21, 38, 2, 8, 6, 21, 19, 36, 0, 6, 4, 19
			character_map[result].to_s                                                           # => "v", ",", "c", "i", "g", "v", "t", " ", "a", "g", "e", "t"
	end                                                                                    # => :rotation_a

	def rotation_b(rotation_values)
		if @message[1].nil?                                                                # => false, false, false, false, false, true, false, false, false, false, false, true
			""                                                                                # => "", ""
		else
			second_character = @message[1]                                                    # => "h", "i", " ", "e", "c", "f", "g", "8", "c", "a"
			result 					 = (character_map.index(second_character) + rotation_values[1]) % 39  # => 5, 6, 34, 2, 0, 7, 8, 36, 4, 2
			character_map[result].to_s                                                        # => "f", "g", "8", "c", "a", "h", "i", " ", "e", "c"
		end                                                                                # => "f", "g", "8", "c", "a", "", "h", "i", " ", "e", "c", ""
	end                                                                                 # => :rotation_b

	def rotation_c(rotation_values)
		if @message[2].nil?                                                                 # => false, false, false, false, false, true, false, false, false, false, false, true
			""                                                                                 # => "", ""
		else
			third_character  = @message[2]                                                     # => "i", "s", "h", " ", "r", "y", "8", "x", "n", "7"
			result 			     = (character_map.index(third_character) + rotation_values[2]) % 39  # => 24, 34, 23, 13, 33, 8, 18, 7, 36, 17
			character_map[result].to_s                                                         # => "y", "8", "x", "n", "7", "i", "s", "h", " ", "r"
		end                                                                                 # => "y", "8", "x", "n", "7", "", "i", "s", "h", " ", "r", ""
	end                                                                                  # => :rotation_c

	def rotation_d(rotation_values)
		if @message[3].nil?                                                                # => false, false, false, false, false, true, false, false, false, false, false, true
			""                                                                                # => "", ""
		else
			fourth_character = @message[3]                                                    # => "s", " ", "u", "s", "e", "w", "b", "y", "w", "i"
			result 					 = (character_map.index(fourth_character) + rotation_values[3]) % 39  # => 22, 1, 24, 22, 8, 18, 36, 20, 18, 4
			character_map[result].to_s                                                        # => "w", "b", "y", "w", "i", "s", " ", "u", "s", "e"
		end                                                                                # => "w", "b", "y", "w", "i", "", "s", " ", "u", "s", "e", ""
	end                                                                                 # => :rotation_d

	private  # => Rotator

	def key_encryptor(first_index, second_index)
		key_pair_amount  = (key[first_index] + key[second_index]).to_i  # => 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53, 38, 73, 35, 53...
  	offset_amount 	 = offset[first_index].to_i                     # => 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5
  	key_pair_amount + offset_amount                                # => 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55, 43, 80, 37, 55...
	end                                                              # => :key_encryptor
end                                                               # => :key_encryptor

key = Key.new.key_generator                                    # => "73538"
oc = OffsetCalc.new.last_four_digits_of_squared_date           # => "7225"
encrypted = Rotator.encrypt(key, oc, "this is a huge secret")  # => "vfyw,g8bc8xyicnwga7iv"
encrypted                                                      # => "vfyw,g8bc8xyicnwga7iv"
decrypted = Rotator.decrypt(key, oc, encrypted)                # => "this is a huge secret"







