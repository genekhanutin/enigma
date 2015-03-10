require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Encrypt

  def initialize
    @key         = Key.new.key_generator
    @date        = Time.now.strftime("%m%d%y")
    @message     = File.read(ARGV[0])
    @offset = OffsetCalc.new
  end

  def run
    rotator = Rotator.encrypt(@key, @offset.last_four_digits_of_squared_date, @message)
    File.write(ARGV[1] , rotator)
    puts "Created #{ARGV[1]} with key #{@key} and date #{@date}"
  end
end

encryptor = Encrypt.new
encryptor.run
    