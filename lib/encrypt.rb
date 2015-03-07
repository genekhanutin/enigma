require_relative 'key'          # => true
require_relative 'offset_calc'  # => true
require_relative 'rotator'      # => true

class Encrypt
	def run(file)
	message    = File.read(file)
	key        = Key.new
	offset     = OffsetCalc.new
	# Rotator.new - takes key (integer), offset (integer), message(string)
	#key.key_parser -> array
	# offest.last_four_digits_of_squared_date -> array
	#message -> string
	rotator    = Rotator.new(key.key_generator, offset.last_four_digits_of_squared_date, message)

	File.open("encrypt.txt", "w") { |f| f.write(rotator.encrypt)} 
		# pass in a file to rotator as the message. rotator will do the encryption, not the Encrypt class
		# Encrypt also needs to call rotator.big_ass_method
	end                                                            # => :run
end                                                             # => :run


# run this file; pass in input file as arg
# and output file as arg
# get filepaths from ARGV
# create new instance of encrypt with those
# and run .encrypt or something