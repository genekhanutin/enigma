class Rotator
	attr_reader :key, :offset

	def initialize(key = 0, offset = 0)
		@key    = key.to_s
		@offset = offset.to_s
	end

	def character_map
		map = [*('a'..'z'), *(0..9), ' ', '.', ',']
	end

	def sum_of_key_and_offset
  	4.times.map do |i|
  		first_index  = i
  		second_index = i + 1

  		key_element    = (key[first_index] + key[second_index]).to_i
  		offset_element = offset[first_index].to_i

  		key_element + offset_element 
  	end
	end

	
end

rotator = Rotator.new
rotator.character_map