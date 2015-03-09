require_relative 'key'          # => true
require_relative 'offset_calc'  # => true
require_relative 'rotator'      # => true

class Encrypt

	def initialize
		@key     = Key.new                                      # => #<Key:0x007f910207a888>
		@offset  = OffsetCalc.new                               # => #<OffsetCalc:0x007f910207a3b0 @date=30815>
		@message = File.open('~/home_work/enigma/lib/message_sample1.txt', 'r' )  # ~> Errno::ENOENT: No such file or directory @ rb_sysopen - lib/message_sample1.txt
	end                                                      # => :initialize

	def run
		rotator = Rotator.encrypt(@key.key_generator, @offset.last_four_digits_of_squared_date, @message)
		file_to_write_to = File.write(ARGV[1] || '../enigma/lib/encrypted.txt' , 'w')
		file_to_write_to.puts(@message || "a secret message for you")
		file_to_write_to.close
	end                                                                                                 # => :run
	# prints created encrypted file...with key...with offset...                                                                                                # => :run
end                                                                                                  # => :run

encryptor = Encrypt.new
encryptor.run



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

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - lib/message_sample1.txt
# ~>
# ~> /Users/genekhanutin/home_work/enigma/lib/encrypt.rb:10:in `initialize'
# ~> /Users/genekhanutin/home_work/enigma/lib/encrypt.rb:10:in `open'
# ~> /Users/genekhanutin/home_work/enigma/lib/encrypt.rb:10:in `initialize'
# ~> /Users/genekhanutin/home_work/enigma/lib/encrypt.rb:22:in `new'
# ~> /Users/genekhanutin/home_work/enigma/lib/encrypt.rb:22:in `<main>'

