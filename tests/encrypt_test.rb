require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'encrypt'

class EncryptTest < MiniTest::Test
	def test_it_can_enrypt_a_message_to_a_txt_file
		key = 
		offset
		encryptor = Encrypt.new.encrypt_message(file)

		assert_equal "encrypt message". File.open
	end
end