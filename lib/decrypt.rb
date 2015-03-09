require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Decrypt

	def initialize
		@key     = ARGV[2]
		@offset  = ARGV[3]
		@message = File.read(ARGV[0])
	end

	def run
		rotator = Rotator.decrypt(@key, @offset, @message)
		File.write(ARGV[1] , rotator)
		puts "Created #{ARGV[1]} with key #{@key} and offset #{@offset}"
	end
end

decryptor = Decrypt.new
decryptor.run