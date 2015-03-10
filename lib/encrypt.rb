require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Encrypt

  def initialize
    @key     = Key.new.key_generator
    @offset  = OffsetCalc.new.last_four_digits_of_squared_date
    @message = File.read(ARGV[0])
  end

  def run
    rotator = Rotator.encrypt(@key, @offset, @message)
    File.write(ARGV[1] , rotator)
    puts "Created #{ARGV[1]} with key #{@key} and offset #{@offset}"
  end
end

encryptor = Encrypt.new
encryptor.run