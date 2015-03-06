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

	def test_rotation_value_generator_method_returns_new_rotation_values_after_applying_offset
		key     = 12345
		offset  = 1234
		rotator = Rotator.new(key, offset)
		assert_equal [13, 25, 37, 49], rotator.rotation_value_generator
	end

	def test_rotation_value_generator_method_returns_different_rotation_values_after_applying_offset
		key     = 23456
		offset  = 1234
		rotator = Rotator.new(key, offset)
		assert_equal [24, 36, 48, 60], rotator.rotation_value_generator
	end

	def test_rotation_value_generator_method_can_assign_each_rotation_value_to_variables
		rotator = Rotator.new(23456, 1234)
		a,b,c,d = rotator.rotation_value_generator
		assert_equal 24, a 
		assert_equal 36, b 
		assert_equal 48, c 
		assert_equal 60, d 
	end

	def test_rotation_a_rotates_first_letter_by_first_rotation_value
		rotator = Rotator.new(23456, 1234, "jklm")
		rotation_values = rotator.rotation_value_generator

		assert_equal "7", rotator.rotation_a(rotation_values)
	end

	def test_rotation_b_rotates_second_letter_by_second_rotation_value
		rotator = Rotator.new(23456, 1234, "abcd")
		rotation_values = rotator.rotation_value_generator

		assert_equal ".", rotator.rotation_b(rotation_values)
	end

	def test_rotation_c_rotates_third_letter_by_third_rotation_value
		rotator = Rotator.new(23456, 1234, "abcd")

		assert_equal "l", rotator.rotation_c(rotator.rotation_value_generator)
	end

	def test_it_rotates_four_characters_by_total_rotation_valuesd
		rotator = Rotator.new(23456, 1234, "abcd")

		assert_equal "y", rotator.rotation_d(rotator.rotation_value_generator)
	end

	def test_it_encrypts_four_characters_at_a_time
		rotator = Rotator.new(23456, 1234, "jbcd")

		assert_equal "7.ly", rotator.encrypt
  end

	def test_it_can_encrypt_eight_letters
		rotator = Rotator.new(23456, 1234, "jbcdfefebomb")
			# why is this passing?
		assert_equal "7.ly", rotator.encrypt
	end

	def test_it_can_encrypt_ten_letters
	end

end