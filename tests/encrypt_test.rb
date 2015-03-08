require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encrypt'

class EncryptTest < MiniTest::Test
	def test_it_can_enrypt_a_message_to_a_txt_file
		key       = 23456 
		offset    = 1234
		encryptor = Encrypt.new.encrypt_message(file)

		assert_equal "encrypt message". File.open
	end
end