require 'minitest/autorun'
require 'minitest/pride'
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

	def test_key_parser_returns_array_of_paired_digits
		key = Key.new
		key.stub :key_generator, "12345" do 
		assert_equal [12,23,34,45], key.key_parser
	end
	end
end



