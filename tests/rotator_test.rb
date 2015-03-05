require 'simplecov'
SimpleCov.start
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

		assert_equal [13, 25, 37, 49], rotator.calculate_key_offset_sum
	end

	def test_it_returns_another_key_offset_total_value_array
		key     = 23456
		offset  = 1234
		rotator = Rotator.new(key, offset)

		assert_equal [24, 36, 48, 60], rotator.calculate_key_offset_sum
	end

	def test_assigns_total_rotation_values_to_usable_variables
		rotator = Rotator.new(23456, 1234)
		a,b,c,d = rotator.calculate_key_offset_sum
		assert_equal 24, a 
		assert_equal 36, b 
		assert_equal 48, c 
		assert_equal 60, d 
	end

	def test_it_rotates_a_character_by_given_integer
		rotator = Rotator.new(0, 0, "jjjj")
		assert_equal "7gs4", rotator.rotate_by([24, 36, 48, 60]) 
	end

end