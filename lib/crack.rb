require_relative 'key'
require_relative 'offset_calc'
require_relative 'rotator'

class Crack
  def initialize
    @offset  = ARGV[2]
    @message = File.read(ARGV[0])
  end

  def run
    cracked_key = Rotator.crack(@offset, @message)
    message = Rotator.decrypt(cracked_key, @offset, @message)
    File.write(ARGV[1] , message)
    puts "Created #{ARGV[1]} with cracked key #{cracked_key} and offset #{@offset}"
  end
end

crack = Crack.new
crack.run

