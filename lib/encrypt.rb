require_relative 'key'          # => true
require_relative 'offset_calc'  # => true
require_relative 'rotator'      # => true

class Encrypt
	
	def run(file)
	message    = File.read(file)
	key        = Key.new
	offset     = OffsetCalc.new
	rotator    = Rotator.new(key.key_generator, offset.last_four_digits_of_squared_date, message)

	File.open("encrypted.txt", "w") { |f| f.write(rotator.encrypt)} 
	end                                                            # => :run
end                                                             # => :run


# run this file; pass in input file as arg
# and output file as arg
# get filepaths from ARGV
# create new instance of encrypt with those
# and run .encrypt or something


# Rotator.new - takes key (integer), offset (integer), message(string)
#key.key_parser -> array
# offest.last_four_digits_of_squared_date -> array
#message -> string