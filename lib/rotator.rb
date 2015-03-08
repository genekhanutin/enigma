require "pry"                   # => true
require_relative "key"          # => true
require_relative "offset_calc"  # => true

class Rotator
	attr_reader :key, :offset  # => nil

	def initialize(key = 0, offset = 0, message = "")
		@key     = key.to_s                               # => "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175", "42175"
		@offset  = offset.to_s                            # => "4225", "4225", "4225", "4225", "4225", "4225", "4225", "1225", "1225", "1225", "1225", "1225", "1225", "1225"
		@message = message                                # => "hey ", "mamb", "o, m", "ambo", " ita", "lian", "o", "o1e,", "tx5d", "vwqo", "h9uq", "e5,c", "s5tp", "v"
	end                                                # => :initialize

	def self.encrypt(key, date_offset, message)
		encrypted = message.chars.each_slice(4).map do |slice|                   # => #<Enumerator: ["h", "e", "y", " ", "m", "a", "m", "b", "o", ",", " ", "m", "a", "m", "b", "o", " ", "i", "t", "a", "l", "i", "a", "n", "o"]:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters  # => "o1e,", "tx5d", "vwqo", "h9uq", "e5,c", "s5tp", "v"
		end                                                                      # => ["o1e,", "tx5d", "vwqo", "h9uq", "e5,c", "s5tp", "v"]
		encrypted.join                                                           # => "o1e,tx5dvwqoh9uqe5,cs5tpv"
	end                                                                       # => :encrypt

	def self.decrypt(key, date_offset, message)
		decrypted = message.chars.each_slice(4).map do |slice|                   # => #<Enumerator: ["o", "1", "e", ",", "t", "x", "5", "d", "v", "w", "q", "o", "h", "9", "u", "q", "e", "5", ",", "c", "s", "5", "t", "p", "v"]:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_decrypted_characters  # => "key ", "pamb", "r, m", "dmbo", "aita", "oian", "r"
		end                                                                      # => ["key ", "pamb", "r, m", "dmbo", "aita", "oian", "r"]
		decrypted.join                                                           # => "key pambr, mdmboaitaoianr"
	end                                                                       # => :decrypt

	def combine_encrypted_characters
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)  # => "o1e,", "tx5d", "vwqo", "h9uq", "e5,c", "s5tp", "v"
	end                                                                                                                                                         # => :combine_encrypted_characters

	def combine_decrypted_characters
		rotation_vals = rotation_value_generator.map do |i|                                                            # => [43, 23, 19, 80], [43, 23, 19, 80], [43, 23, 19, 80], [43, 23, 19, 80], [43, 23, 19, 80], [43, 23, 19, 80], [43, 23, 19, 80]
			-i                                                                                                            # => -43, -23, -19, -80, -43, -23, -19, -80, -43, -23, -19, -80, -43, -23, -19, -80, -43, -23, -19, -80, -43, -23, -19, -80, -43, -23, -19, -80
		end                                                                                                            # => [-43, -23, -19, -80], [-43, -23, -19, -80], [-43, -23, -19, -80], [-43, -23, -19, -80], [-43, -23, -19, -80], [-43, -23, -19, -80], [-43, -23, -19, -80]
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)  # => "key ", "pamb", "r, m", "dmbo", "aita", "oian", "r"
	end                                                                                                             # => :combine_decrypted_characters
	
	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "...
  end                                                        # => :character_map

	def rotation_value_generator
		encrypted_key = []                                          # => [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
  	4.times do |iteration|                                     # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
  		encrypted_key << key_encryptor(iteration, iteration + 1)  # => [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80], [46], [46, 23], [46, 23, 19], [46, 23, 19, 80]...
  	end                                                        # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
  	encrypted_key                                              # => [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80], [46, 23, 19, 80]...
	end                                                          # => :rotation_value_generator

	def rotation_a(rotation_values)
		first_character  = @message[0]                                                       # => "h", "m", "o", "a", " ", "l", "o", "o", "t", "v", "h", "e", "s", "v"
		result           = (character_map.index(first_character) + rotation_values[0]) % 39  # => 14, 19, 21, 7, 4, 18, 21, 10, 15, 17, 3, 0, 14, 17
		character_map[result].to_s                                                           # => "o", "t", "v", "h", "e", "s", "v", "k", "p", "r", "d", "a", "o", "r"
	end                                                                                   # => :rotation_a

	def rotation_b(rotation_values)
		if @message[1].nil?                                                                # => false, false, false, false, false, false, true, false, false, false, false, false, false, true
			""                                                                                # => "", ""
		else
			second_character = @message[1]                                                    # => "e", "a", ",", "m", "i", "i", "1", "x", "w", "9", "5", "5"
			result 					 = (character_map.index(second_character) + rotation_values[1]) % 39  # => 27, 23, 22, 35, 31, 31, 4, 0, 38, 12, 8, 8
			character_map[result].to_s                                                        # => "1", "x", "w", "9", "5", "5", "e", "a", ",", "m", "i", "i"
		end                                                                                # => "1", "x", "w", "9", "5", "5", "", "e", "a", ",", "m", "i", "i", ""
	end                                                                                 # => :rotation_b

	def rotation_c(rotation_values)
		if @message[2].nil?                                                                 # => false, false, false, false, false, false, true, false, false, false, false, false, false, true
			""                                                                                 # => "", ""
		else
			third_character  = @message[2]                                                     # => "y", "m", " ", "b", "t", "a", "e", "5", "q", "u", ",", "t"
			result 			     = (character_map.index(third_character) + rotation_values[2]) % 39  # => 4, 31, 16, 20, 38, 19, 24, 12, 36, 1, 19, 0
			character_map[result].to_s                                                         # => "e", "5", "q", "u", ",", "t", "y", "m", " ", "b", "t", "a"
		end                                                                                 # => "e", "5", "q", "u", ",", "t", "", "y", "m", " ", "b", "t", "a", ""
	end                                                                                  # => :rotation_c

	def rotation_d(rotation_values)
		if @message[3].nil?                                                                # => false, false, false, false, false, false, true, false, false, false, false, false, false, true
			""                                                                                # => "", ""
		else
			fourth_character = @message[3]                                                    # => " ", "b", "m", "o", "a", "n", ",", "d", "o", "q", "c", "p"
			result 					 = (character_map.index(fourth_character) + rotation_values[3]) % 39  # => 38, 3, 14, 16, 2, 15, 36, 1, 12, 14, 0, 13
			character_map[result].to_s                                                        # => ",", "d", "o", "q", "c", "p", " ", "b", "m", "o", "a", "n"
		end                                                                                # => ",", "d", "o", "q", "c", "p", "", " ", "b", "m", "o", "a", "n", ""
	end                                                                                 # => :rotation_d

	private  # => Rotator

	def key_encryptor(first_index, second_index)
		key_pair_amount  = (key[first_index] + key[second_index]).to_i  # => 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17, 75, 42, 21, 17...
  	offset_amount 	 = offset[first_index].to_i                     # => 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 4, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5, 1, 2, 2, 5
  	key_pair_amount + offset_amount                                # => 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19, 80, 46, 23, 19...
	end                                                              # => :key_encryptor
end                                                               # => :key_encryptor

key = Key.new.key_generator                                                    # => "42175"
offset = OffsetCalc.new.last_four_digits_of_squared_date                       # => "4225"
encrypted_message = Rotator.encrypt(key, offset, "hey mambo, mambo italiano")  # => "o1e,tx5dvwqoh9uqe5,cs5tpv"
Rotator.decrypt(key, 1225, encrypted_message)                                  # => "key pambr, mdmboaitaoianr"



