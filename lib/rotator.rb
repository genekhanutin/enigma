require "pry"               # => true
class Rotator
	attr_reader :key, :offset  # => nil

	def initialize(key = 0, offset = 0, message = "")
		@key     = key.to_s                               # => "0", "41521", "41521", "41521", "41521", "41521", "41521", "41521"
		@offset  = offset.to_s                            # => "0", "9225", "9225", "9225", "9225", "9225", "9225", "9225"
		@message = message                                # => "", "to08", "vvm2", "z5z8", "p9mb", "yo1b", "yupl", "j"
	end                                                # => :initialize

	def self.encrypt(key, date_offset, message)
		encrypted = message.chars.each_slice(4).map do |slice|
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters
		end
		encrypted.join
	end                                                                       # => :encrypt

	def self.decrypt(key, date_offset, message)
		decrypted = message.chars.each_slice(4).map do |slice|                   # => #<Enumerator: ["t", "o", "0", "8", "v", "v", "m", "2", "z", "5", "z", "8", "p", "9", "m", "b", "y", "o", "1", "b", "y", "u", "p", "l", "j"]:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_decrypted_characters  # => "i li", "ke c", "ooki", "es o", "n mo", "nday", "."
		end                                                                      # => ["i li", "ke c", "ooki", "es o", "n mo", "nday", "."]
		decrypted.join                                                           # => "i like cookies on monday."
	end                                                                       # => :decrypt

	def combine_encrypted_characters
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)
	end                                                                                                                                                         # => :combine_encrypted_characters

	def combine_decrypted_characters
		rotation_vals = rotation_value_generator.map do |i|                                                            # => [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26]
			-i                                                                                                            # => -50, -17, -54, -26, -50, -17, -54, -26, -50, -17, -54, -26, -50, -17, -54, -26, -50, -17, -54, -26, -50, -17, -54, -26, -50, -17, -54, -26
		end                                                                                                            # => [-50, -17, -54, -26], [-50, -17, -54, -26], [-50, -17, -54, -26], [-50, -17, -54, -26], [-50, -17, -54, -26], [-50, -17, -54, -26], [-50, -17, -54, -26]
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)  # => "i li", "ke c", "ooki", "es o", "n mo", "nday", "."
	end                                                                                                             # => :combine_decrypted_characters
	
	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "...
  end                                                        # => :character_map

	def rotation_value_generator
		encrypted_key = []                                        # => [], [], [], [], [], [], []
  	4.times do |iteration|                                   # => 4, 4, 4, 4, 4, 4, 4
  		encrypted_key << key_encryptor(iteration, iteration + 1)  # => [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26], [50], [50, 17], [50, 17, 54], [50, 17, 54, 26]
  	end                                                      # => 4, 4, 4, 4, 4, 4, 4
  	encrypted_key                                            # => [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26], [50, 17, 54, 26]
	end                                                        # => :rotation_value_generator

	def rotation_a(rotation_values)
		first_character  = @message[0]                                                       # => "t", "v", "z", "p", "y", "y", "j"
		result           = (character_map.index(first_character) + rotation_values[0]) % 39  # => 8, 10, 14, 4, 13, 13, 37
		character_map[result].to_s                                                           # => "i", "k", "o", "e", "n", "n", "."
	end                                                                                   # => :rotation_a

	def rotation_b(rotation_values)
		if @message[1].nil?                                                                # => false, false, false, false, false, false, true
			""                                                                                # => ""
		else
			second_character = @message[1]                                                    # => "o", "v", "5", "9", "o", "u"
			result 					 = (character_map.index(second_character) + rotation_values[1]) % 39  # => 36, 4, 14, 18, 36, 3
			character_map[result].to_s                                                        # => " ", "e", "o", "s", " ", "d"
		end                                                                                # => " ", "e", "o", "s", " ", "d", ""
	end                                                                                 # => :rotation_b

	def rotation_c(rotation_values)
		if @message[2].nil?                                                                 # => false, false, false, false, false, false, true
			""                                                                                 # => ""
		else
			third_character  = @message[2]                                                     # => "0", "m", "z", "m", "1", "p"
			result 			     = (character_map.index(third_character) + rotation_values[2]) % 39  # => 11, 36, 10, 36, 12, 0
			character_map[result].to_s                                                         # => "l", " ", "k", " ", "m", "a"
		end                                                                                 # => "l", " ", "k", " ", "m", "a", ""
	end                                                                                  # => :rotation_c

	def rotation_d(rotation_values)
		if @message[3].nil?                                                                # => false, false, false, false, false, false, true
			""                                                                                # => ""
		else
			fourth_character = @message[3]                                                    # => "8", "2", "8", "b", "b", "l"
			result 					 = (character_map.index(fourth_character) + rotation_values[3]) % 39  # => 8, 2, 8, 14, 14, 24
			character_map[result].to_s                                                        # => "i", "c", "i", "o", "o", "y"
		end                                                                                # => "i", "c", "i", "o", "o", "y", ""
	end                                                                                 # => :rotation_d

	private  # => Rotator

	def key_encryptor(first_index, second_index)
		key_pair_amount  = (key[first_index] + key[second_index]).to_i  # => 41, 15, 52, 21, 41, 15, 52, 21, 41, 15, 52, 21, 41, 15, 52, 21, 41, 15, 52, 21, 41, 15, 52, 21, 41, 15, 52, 21
  	offset_amount 	 = offset[first_index].to_i                     # => 9, 2, 2, 5, 9, 2, 2, 5, 9, 2, 2, 5, 9, 2, 2, 5, 9, 2, 2, 5, 9, 2, 2, 5, 9, 2, 2, 5
  	key_pair_amount + offset_amount                                # => 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26, 50, 17, 54, 26
	end                                                              # => :key_encryptor
end                                                               # => :key_encryptor


rotator = Rotator.new  # => #<Rotator:0x007fecdb8704b8 @key="0", @offset="0", @message="">
rotator.character_map  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

Rotator.decrypt(41521, 9225, "to08vvm2z5z8p9mbyo1byuplj")  # => "i like cookies on monday."


