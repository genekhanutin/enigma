require 'simplecov'         # => true
SimpleCov.start             # => nil
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/key'

class KeyTest < Minitest::Test
	def test_it_exists
		key = Key.new
		assert key
	end

	def test_key_generator_generates_five_digit_key
		key = Key.new
		assert_equal 5, key.key_generator.length
	end

	def test_key_generator_returns_array_of_paired_digits
		key = Key.new
		key.stub :key_generator, "12345" do 
		assert_equal "12345", key.key_generator
	  end
	end

	def test_key_generator_does_not_return_zeros_in_offset
		key = Key.new

		refute key.key_generator.include?("0")
	end	
end

# >> Coverage report generated for MiniTest to /Users/genekhanutin/home_work/enigma/lib/coverage. 0.0 / 0.0 LOC (100.0%) covered.



