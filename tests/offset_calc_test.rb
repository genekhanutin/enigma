require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calc'


class OffSetCalcTest < Minitest::Test
	def test_it_exists
		assert OffSetCalc
	end

	def test_it_has_a_date_in_ddmmyy_format
		oc = OffSetCalc.new("121212")
		assert_equal 121212, oc.date
	end

	def test_it_squares_if_date_starts_with_zero
		oc = OffSetCalc.new("022315")
		assert_equal 14960959225, oc.square_date
	end

	def test_it_squares_if_date_starts_with_zero
		oc = OffSetCalc.new("122315")
		assert_equal 14960959225, oc.square_date
	end	

	def test_it_returns_last_four_digits_of_squared_date_in_array
		oc = OffSetCalc.new("122315")
		assert_equal [9,2,2,5], oc.last_four_digits_of_squared_date
	end
end