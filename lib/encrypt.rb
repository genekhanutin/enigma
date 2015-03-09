require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Encrypt

	def initialize
		@key     = Key.new
		@offset  = OffsetCalc.new
		@message = File.read(ARGV[0]) #|| 'lib/message_sample1.txt')
	end

	def run
		rotator = Rotator.encrypt(@key.key_generator, @offset.last_four_digits_of_squared_date, @message)
		#file_to_write_to = File.write(ARGV[2] , rotator)
		#file_to_write_to.puts(@message || "here is a secret message")
		#file_to_write_to.close
		puts rotator
	end
	# prints: "created encrypted file...with key...with offset..."                                                                                                # => :run
end

encryptor = Encrypt.new
encryptor.run