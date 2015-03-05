require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotator'

class RotatorTest < Minitest::Test

	def test_it_has_a_character_map_with_39_characters
		rotator = Rotator.new
		assert_equal 39, rotator.character_map.count
	end

	def test_it_returns_key_offset_total_value_array
		key     = 12345
		offset  = 1234
		rotator = Rotator.new(key, offset)

		assert_equal [13, 25, 37, 49], rotator.sum_of_key_and_offset
	end

	def test_it_returns_another_key_offset_total_value_array
		key     = 23456
		offset  = 1234
		rotator = Rotator.new(key, offset)

		assert_equal [24, 36, 48, 60], rotator.sum_of_key_and_offset
	end
end