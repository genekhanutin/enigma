require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Encrypt

	def initialize
		@key     = Key.new
		@offset  = OffsetCalc.new
		@message = File.open(ARGV[0] || 'message_sample1.txt' , 'r' )
	end

	def run
		rotator = Rotator.

f = File.new('../enigma/lib/message_sample1.txt' , 'w')
f.puts("here is a secret message, don't tell anyone about it. if you do, you will have to face serious consequences. you'll have to attend turing for 7 months!")
f.close
end



# encryptor = Encrypt.new
# encryptor.run(sample_message1.txt)

# run this file; pass in input file as arg
# and output file as arg
# get filepaths from ARGV
# create new instance of encrypt with those
# and run .encrypt or something


# Rotator.new - takes key (integer), offset (integer), message(string)
#key.key_parser -> array
# offest.last_four_digits_of_squared_date -> array
#message -> string

# def initialize(read_doc = nil, write_doc = nil)
#    read_doc ? @read_doc = read_doc : @read_doc = File.read(ARGV[0]).strip
#    write_doc ? @write_doc = write_doc : @write_doc = (ARGV[1])
#    key ? @key = key : @key = ARGV[2]
#    date ? @date = date : @date = ARGV[3]
#    @rotator = Rotator.new(@read_doc, @key, @date)
# end

# def initialize()
	
# 	def run(file)
# 	message    = File.read(file)
# 	key        = Key.new
# 	offset     = OffsetCalc.new
# 	rotator    = Rotator.new(key.key_generator, offset.last_four_digits_of_squared_date, message)

# 	File.open("encrypted.txt", "w") { |f| f.write(rotator.encrypt)} 
# 	end         

