require "pry"                   # => true
require_relative "key"          # => true
require_relative "offset_calc"  # => true

class Rotator
	attr_reader :key, :offset  # => nil

	def initialize(key = 0, offset = 0, message = "")
		key                                               # => "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187",...
		@key     = key.to_s                               # => "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187", "29187",...
		@offset  = offset.to_s                            # => "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", "7225", ...
		@message = message                                # => "this", " is ", "a se", "cret", " mes", "sage", ", do", " not", " tel", "l an", "yone", " abo", "ut i", "t. i", "f yo", "u do", " you", " wil", "l fa", "ce s", "erio", "us c", "onse", "quen", "ces.", " you", " wil", "l ha", "ve t", "o at", "tend", " tur", "ing ", "for ", "7 mo", "nths", ".", "qw26", "7x,l", " m,s", ",6y7", "71y6", "pp0s", "9mx2", "7287", "78yz", "imu1", "v37s", "7pv2", "r8rw", "qnrw", "cmf2", "rmx2", "7a88", "7.2z", "im...
	end                                                # => :initialize

	def self.encrypt(key, date_offset, message)
		encrypted = message.each_char.each_slice(4).map do |slice|               # => #<Enumerator: #<Enumerator: "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months.":each_char>:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_encrypted_characters  # => "qw26", "7x,l", " m,s", ",6y7", "71y6", "pp0s", "9mx2", "7287", "78yz", "imu1", "v37s", "7pv2", "r8rw", "qnrw", "cmf2", "rmx2", "7a88", "7.2z", "imzo", ",tr6", "b622", "r7rq", "l2,s", "n9y1", ",t,m", "7a88", "7.2z", "im1o", "str7", "lmu7", "qt7r", "78b5", "f20l", "c3.l", "4m62", "k816", "8"
		end                                                                      # => ["qw26", "7x,l", " m,s", ",6y7", "71y6", "pp0s", "9mx2", "7287", "78yz", "imu1", "v37s", "7pv2", "r8rw", "qnrw", "cmf2", "rmx2", "7a88", "7.2z", "imzo", ",tr6", "b622", "r7rq", "l2,s", "n9y1", ",t,m", "7a88", "7.2z", "im1o", "str7", "lmu7", "qt7r", "78b5", "f20l", "c3.l", "4m62", "k816", "8"]
		encrypted.join                                                           # => "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168"
	end                                                                       # => :encrypt

	def self.decrypt(key, date_offset, message)
		decrypted = message.each_char.each_slice(4).map do |slice|               # => #<Enumerator: #<Enumerator: "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168":each_char>:each_slice(4)>
			Rotator.new(key, date_offset, slice.join).combine_decrypted_characters  # => "this", " is ", "a se", "cret", " mes", "sage", ", do", " not", " tel", "l an", "yone", " abo", "ut i", "t. i", "f yo", "u do", " you", " wil", "l fa", "ce s", "erio", "us c", "onse", "quen", "ces.", " you", " wil", "l ha", "ve t", "o at", "tend", " tur", "ing ", "for ", "7 mo", "nths", "."
		end                                                                      # => ["this", " is ", "a se", "cret", " mes", "sage", ", do", " not", " tel", "l an", "yone", " abo", "ut i", "t. i", "f yo", "u do", " you", " wil", "l fa", "ce s", "erio", "us c", "onse", "quen", "ces.", " you", " wil", "l ha", "ve t", "o at", "tend", " tur", "ing ", "for ", "7 mo", "nths", "."]
		decrypted.join                                                           # => "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months."
	end

	def self.crack(date_offset, message)
		key = 10000
		unencrypted_message = ""
		while unencrypted_message[-7..-1] != "..end.." do
			key += 1
			unencrypted_message = Rotator.decrypt(key, date_offset, message)
		end
		key
	end                                                                       # => :decrypt

	def combine_encrypted_characters
		rotation_a(rotation_value_generator) + rotation_b(rotation_value_generator) + rotation_c(rotation_value_generator) + rotation_d(rotation_value_generator)  # => "qw26", "7x,l", " m,s", ",6y7", "71y6", "pp0s", "9mx2", "7287", "78yz", "imu1", "v37s", "7pv2", "r8rw", "qnrw", "cmf2", "rmx2", "7a88", "7.2z", "imzo", ",tr6", "b622", "r7rq", "l2,s", "n9y1", ",t,m", "7a88", "7.2z", "im1o", "str7", "lmu7", "qt7r", "78b5", "f20l", "c3.l", "4m62", "k816", "8"
	end                                                                                                                                                         # => :combine_encrypted_characters

	def combine_decrypted_characters
		rotation_vals = rotation_value_generator.map do |i|                                                            # => [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [...
			-i                                                                                                            # => -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92, -36, -93, -20, -92,...
		end                                                                                                            # => [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36, -93, -20, -92], [-36,...
		rotation_a(rotation_vals) + rotation_b(rotation_vals) + rotation_c(rotation_vals) + rotation_d(rotation_vals)  # => "this", " is ", "a se", "cret", " mes", "sage", ", do", " not", " tel", "l an", "yone", " abo", "ut i", "t. i", "f yo", "u do", " you", " wil", "l fa", "ce s", "erio", "us c", "onse", "quen", "ces.", " you", " wil", "l ha", "ve t", "o at", "tend", " tur", "ing ", "for ", "7 mo", "nths", "."
	end                                                                                                             # => :combine_decrypted_characters
	
	def character_map
		character_map = [*('a'..'z'), *("0".."9"), ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "...
  end                                                        # => :character_map

	def rotation_value_generator
		encryption_key = []                                          # => [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [...
  	4.times do |iteration|                                      # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, ...
  		encryption_key << key_encryptor(iteration, iteration + 1)  # => [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92], [36], [36, 93], [36, 93, 20], [36, 93, 20, 92...
  	end                                                         # => 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, ...
  	encryption_key                                              # => [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92], [36, 93, 20, 92...
	end                                                           # => :rotation_value_generator

	def rotation_a(rotation_values)
			first_character  = @message[0]                                                       # => "t", " ", "a", "c", " ", "s", ",", " ", " ", "l", "y", " ", "u", "t", "f", "u", " ", " ", "l", "c", "e", "u", "o", "q", "c", " ", " ", "l", "v", "o", "t", " ", "i", "f", "7", "n", ".", "q", "7", " ", ",", "7", "p", "9", "7", "7", "i", "v", "7", "r", "q", "c", "r", "7", "7", "i", ",", "b", "r", "l", "n", ",", "7", "7", "i", "s", "l", "q", "7", "f", "c", "4", "k", "8"
			result           = (character_map.index(first_character) + rotation_values[0]) % 39  # => 16, 33, 36, 38, 33, 15, 35, 33, 33, 8, 21, 33, 17, 16, 2, 17, 33, 33, 8, 38, 1, 17, 11, 13, 38, 33, 33, 8, 18, 11, 16, 33, 5, 2, 30, 10, 34, 19, 36, 0, 2, 36, 18, 38, 36, 36, 11, 24, 36, 20, 19, 5, 20, 36, 36, 11, 2, 4, 20, 14, 16, 2, 36, 36, 11, 21, 14, 19, 36, 8, 5, 33, 13, 37
			character_map[result].to_s                                                           # => "q", "7", " ", ",", "7", "p", "9", "7", "7", "i", "v", "7", "r", "q", "c", "r", "7", "7", "i", ",", "b", "r", "l", "n", ",", "7", "7", "i", "s", "l", "q", "7", "f", "c", "4", "k", "8", "t", " ", "a", "c", " ", "s", ",", " ", " ", "l", "y", " ", "u", "t", "f", "u", " ", " ", "l", "c", "e", "u", "o", "q", "c", " ", " ", "l", "v", "o", "t", " ", "i", "f", "7", "n", "."
	end                                                                                    # => :rotation_a

	def rotation_b(rotation_values)
		if @message[1].nil?                                                                # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, fa...
			""                                                                                # => "", ""
		else
			second_character = @message[1]                                                    # => "h", "i", " ", "r", "m", "a", " ", "n", "t", " ", "o", "a", "t", ".", " ", " ", "y", "w", " ", "e", "r", "s", "n", "u", "e", "y", "w", " ", "e", " ", "e", "t", "n", "o", " ", "t", "w", "x", "m", "6", "1", "p", "m", "2", "8", "m", "3", "p", "8", "n", "m", "m", "a", ".", "m", "t", "6", "7", "2", "9", "t", "a", ".", "m", "t", "m", "t", "8", "2", "3", "m", "8"
			result 					 = (character_map.index(second_character) + rotation_values[1]) % 39  # => 22, 23, 12, 32, 27, 15, 12, 28, 34, 12, 29, 15, 34, 13, 12, 12, 0, 37, 12, 19, 32, 33, 28, 35, 19, 0, 37, 12, 19, 12, 19, 34, 28, 29, 12, 34, 7, 8, 36, 17, 12, 0, 36, 13, 19, 36, 14, 0, 19, 37, 36, 36, 24, 22, 36, 4, 17, 18, 13, 20, 4, 24, 22, 36, 4, 36, 4, 19, 13, 14, 36, 19
			character_map[result].to_s                                                        # => "w", "x", "m", "6", "1", "p", "m", "2", "8", "m", "3", "p", "8", "n", "m", "m", "a", ".", "m", "t", "6", "7", "2", "9", "t", "a", ".", "m", "t", "m", "t", "8", "2", "3", "m", "8", "h", "i", " ", "r", "m", "a", " ", "n", "t", " ", "o", "a", "t", ".", " ", " ", "y", "w", " ", "e", "r", "s", "n", "u", "e", "y", "w", " ", "e", " ", "e", "t", "n", "o", " ", "t"
		end                                                                                # => "w", "x", "m", "6", "1", "p", "m", "2", "8", "m", "3", "p", "8", "n", "m", "m", "a", ".", "m", "t", "6", "7", "2", "9", "t", "a", ".", "m", "t", "m", "t", "8", "2", "3", "m", "8", "", "h", "i", " ", "r", "m", "a", " ", "n", "t", " ", "o", "a", "t", ".", " ", " ", "y", "w", " ", "e", "r", "s", "n", "u", "e", "y", "w", " ", "e", " ", "e", "t", "n", "o", " ", "t", ""
	end                                                                                 # => :rotation_b

	def rotation_c(rotation_values)
		if @message[2].nil?                                                                 # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, f...
			""                                                                                 # => "", ""
		else
			third_character  = @message[2]                                                     # => "i", "s", "s", "e", "e", "g", "d", "o", "e", "a", "n", "b", " ", " ", "y", "d", "o", "i", "f", " ", "i", " ", "s", "e", "s", "o", "i", "h", " ", "a", "n", "u", "g", "r", "m", "h", "2", ",", ",", "y", "y", "0", "x", "8", "y", "u", "7", "v", "r", "r", "f", "x", "8", "2", "z", "r", "2", "r", ",", "y", ",", "8", "2", "1", "r", "u", "7", "b", "0", ".", "6", "1"
			result 			     = (character_map.index(third_character) + rotation_values[2]) % 39  # => 28, 38, 38, 24, 24, 26, 23, 34, 24, 20, 33, 21, 17, 17, 5, 23, 34, 28, 25, 17, 28, 17, 38, 24, 38, 34, 28, 27, 17, 20, 33, 1, 26, 37, 32, 27, 8, 18, 18, 4, 4, 6, 3, 14, 4, 0, 13, 1, 36, 36, 24, 3, 14, 8, 5, 36, 8, 36, 18, 4, 18, 14, 8, 7, 36, 0, 13, 20, 6, 17, 12, 7
			character_map[result].to_s                                                         # => "2", ",", ",", "y", "y", "0", "x", "8", "y", "u", "7", "v", "r", "r", "f", "x", "8", "2", "z", "r", "2", "r", ",", "y", ",", "8", "2", "1", "r", "u", "7", "b", "0", ".", "6", "1", "i", "s", "s", "e", "e", "g", "d", "o", "e", "a", "n", "b", " ", " ", "y", "d", "o", "i", "f", " ", "i", " ", "s", "e", "s", "o", "i", "h", " ", "a", "n", "u", "g", "r", "m", "h"
		end                                                                                 # => "2", ",", ",", "y", "y", "0", "x", "8", "y", "u", "7", "v", "r", "r", "f", "x", "8", "2", "z", "r", "2", "r", ",", "y", ",", "8", "2", "1", "r", "u", "7", "b", "0", ".", "6", "1", "", "i", "s", "s", "e", "e", "g", "d", "o", "e", "a", "n", "b", " ", " ", "y", "d", "o", "i", "f", " ", "i", " ", "s", "e", "s", "o", "i", "h", " ", "a", "n", "u", "g", "r", "m", "h", ""
	end                                                                                  # => :rotation_c

	def rotation_d(rotation_values)
		if @message[3].nil?                                                                # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, fa...
			""                                                                                # => "", ""
		else
			fourth_character = @message[3]                                                    # => "s", " ", "e", "t", "s", "e", "o", "t", "l", "n", "e", "o", "i", "i", "o", "o", "u", "l", "a", "s", "o", "c", "e", "n", ".", "u", "l", "a", "t", "t", "d", "r", " ", " ", "o", "s", "6", "l", "s", "7", "6", "s", "2", "7", "z", "1", "s", "2", "w", "w", "2", "2", "8", "z", "o", "6", "2", "q", "s", "1", "m", "8", "z", "o", "7", "7", "r", "5", "l", "l", "2", "6"
			result 					 = (character_map.index(fourth_character) + rotation_values[3]) % 39  # => 32, 11, 18, 33, 32, 18, 28, 33, 25, 27, 18, 28, 22, 22, 28, 28, 34, 25, 14, 32, 28, 16, 18, 27, 12, 34, 25, 14, 33, 33, 17, 31, 11, 11, 28, 32, 18, 36, 4, 19, 18, 4, 14, 19, 11, 13, 4, 14, 8, 8, 14, 14, 20, 11, 0, 18, 14, 2, 4, 13, 37, 20, 11, 0, 19, 19, 3, 17, 36, 36, 14, 18
			character_map[result].to_s                                                        # => "6", "l", "s", "7", "6", "s", "2", "7", "z", "1", "s", "2", "w", "w", "2", "2", "8", "z", "o", "6", "2", "q", "s", "1", "m", "8", "z", "o", "7", "7", "r", "5", "l", "l", "2", "6", "s", " ", "e", "t", "s", "e", "o", "t", "l", "n", "e", "o", "i", "i", "o", "o", "u", "l", "a", "s", "o", "c", "e", "n", ".", "u", "l", "a", "t", "t", "d", "r", " ", " ", "o", "s"
		end                                                                                # => "6", "l", "s", "7", "6", "s", "2", "7", "z", "1", "s", "2", "w", "w", "2", "2", "8", "z", "o", "6", "2", "q", "s", "1", "m", "8", "z", "o", "7", "7", "r", "5", "l", "l", "2", "6", "", "s", " ", "e", "t", "s", "e", "o", "t", "l", "n", "e", "o", "i", "i", "o", "o", "u", "l", "a", "s", "o", "c", "e", "n", ".", "u", "l", "a", "t", "t", "d", "r", " ", " ", "o", "s", ""
	end                                                                                 # => :rotation_d

	private  # => Rotator

	def key_encryptor(first_index, second_index)
		key_pair_amount  = (key[first_index] + key[second_index]).to_i  # => 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18, 87, 29, 91, 18...
  	offset_amount 	 = offset[first_index].to_i                     # => 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, 2, 5, 7, 2, ...
  	key_pair_amount + offset_amount                                # => 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20, 92, 36, 93, 20...
	end                                                              # => :key_encryptor
end                                                               # => :key_encryptor

# key = Key.new.key_generator                                                                                                                                                                # => "29187"
# oc = OffsetCalc.new.last_four_digits_of_squared_date                                                                                                                                       # => "7225"
# encrypted = Rotator.encrypt(key, oc, "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months.")  # => "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168"
# encrypted                                                                                                                                                                                  # => "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168"
# decrypted = Rotator.decrypt(key, oc, encrypted)                                                                                                                                            # => "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months."







