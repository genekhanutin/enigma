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

	def test_rotation_a_rotates_first_character_by_first_rotation_value
		rotator 				= Rotator.new(23456, 1234, "jklm")
		rotation_values = rotator.rotation_value_generator

		assert_equal "7", rotator.rotation_a(rotation_values)
	end

	def test_rotation_b_rotates_second_character_by_second_rotation_value
		rotator = Rotator.new(23456, 1234, "abcd")
		rotation_values = rotator.rotation_value_generator

		assert_equal ".", rotator.rotation_b(rotation_values)
	end

	def test_rotation_c_rotates_third_character_by_third_rotation_value
		rotator = Rotator.new(23456, 1234, "abcd")

		assert_equal "l", rotator.rotation_c(rotator.rotation_value_generator)
	end

	def test_it_rotates_fourth_character_by_total_rotation_values
		rotator = Rotator.new(23456, 1234, "abcd")

		assert_equal "y", rotator.rotation_d(rotator.rotation_value_generator)
	end

	def test_it_encrypts_four_characters_at_a_time
		assert_equal "7.ly", Rotator.encrypt(23456, 1234, "jbcd")
  end

	def test_it_can_encrypt_eight_letters
		message     = "jbcdfefe"
		key         = 23456
		date_offset = 1234

		assert_equal "7.ly3boz", Rotator.encrypt(key, date_offset, message)
	end

		def test_it_can_encrypt_seven_letters
		message     = "jbcdfef"
		key         = 23456
		date_offset = 1234

		assert_equal "7.ly3bo", Rotator.encrypt(key, date_offset, message)
	end

	def test_it_can_encrypt_six_letters
		message     = "jbcdfe"
		key         = 23456
		date_offset = 1234

		assert_equal "7.ly3b", Rotator.encrypt(key, date_offset, message)
	end

	def test_it_can_encrypt_five_letters
		message     = "jbcdf"
		key         = 23456
		date_offset = 1234

		assert_equal "7.ly3", Rotator.encrypt(key, date_offset, message)
	end

	def test_it_can_encrypt_three_letters
		message     = "jbc"
		key         = 23456
		date_offset = 1234

		assert_equal "7.l", Rotator.encrypt(key, date_offset, message)
	end

	def test_it_can_encrypt_no_letters
		message     = ""
		key         = 23456
		date_offset = 1234

		assert_equal "", Rotator.encrypt(key, date_offset, message)
	end

	def test_it_decrypts_four_characters_at_a_time
		message 		= "7.ly"
		key 				= 23456
		date_offset = 1234

		assert_equal "jbcd", Rotator.decrypt(key, date_offset, message)
  end

  def test_it_decrypts_five_characters_at_a_time
  	message 		= "7.ly3"
  	key     		= 23456
  	date_offset = 1234

		assert_equal "jbcdf", Rotator.decrypt(key, date_offset, message)
	end

	def test_it_decrypts_six_characters_at_a_time
  	message 		= "7.ly3b"
  	key     		= 23456
  	date_offset = 1234
  	
		assert_equal "jbcdfe", Rotator.decrypt(key, date_offset, message)
	end

	def test_it_decrypts_five_characters_at_a_time
  	message 		= "7.ly3"
  	key     		= 23456
  	date_offset = 1234
  	
		assert_equal "jbcdf", Rotator.decrypt(key, date_offset, message)
	end

	def test_it_decrypts_three_characters_at_a_time
		message 		= "7.l"
  	key     		= 23456
  	date_offset = 1234

  	assert_equal "jbc", Rotator.decrypt(key, date_offset, message)
  end

  def test_it_decrypts_one_character
  	message 		= "7"
  	key     		= 23456
  	date_offset = 1234

  	assert_equal "j", Rotator.decrypt(key, date_offset, message)
  end

end