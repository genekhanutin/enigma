class Rotator
	attr_reader :key, :offset  # => nil

	def initialize(key = 0, offset = 0, message = "")
		@key     = key.to_s                               # => "0"
		@offset  = offset.to_s                            # => "0"
		@message = message                                # => ""
		#self.run
	end                                                # => :initialize

	# def	run
	# 	rotate_by(calculate_key_offset_sum
	# end

	# encryptor calls "key" for a key, offset_calc for an offset (maybe just call rotator for all info)
	# then pass them and a message to rotator who will combine and reassign
	# the key and offset and rotate the message by that sum

	def character_map
		character_map = [*('a'..'z'), *(0..9), ' ', '.', ',']  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","]
  end                                                    # => :character_map

	def calculate_key_offset_sum
  	4.times.map do |i|
  		first_index    = i
  		second_index   = i + 1

  		key_element    = (key[first_index] + key[second_index]).to_i
  		offset_element = offset[first_index].to_i

  		key_element + offset_element 
  	end
	end                              # => :calculate_key_offset_sum

	def rotate_by(calculated_key_offset_sum)
		# a,b,c,d         = 
		calculate_key_offset_sum = calculated_key_offset_sum
		first_character = @message[0]
		result = (character_map.index(first_character) + calculate_key_offset_sum[0]) % 39
		character_map[result].to_s
		#(character_map[letter] + calculated_key_offset_sum) % character_map.size
		# how do i return the char not index position
	end                                                                                  # => :rotate_by
end                                                                                   # => :rotate_by

# ((index of original letter) + rotation + offset) % character_map.size`

rotator = Rotator.new  # => #<Rotator:0x007fc5b580b9c0 @key="0", @offset="0", @message="">
rotator.character_map  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, " ", ".", ","]

# sum_of_key_and_offset will be total number of times 
# a,b,c,d rotate each character in text
# text 

# this message is about a bomb
# abcdabcdabcdabcdabcdabcdabcd