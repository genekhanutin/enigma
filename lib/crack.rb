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
    File.write(ARGV[1] , #should be the cracked message which will be written to ARGV[1])
    puts "Created #{ARGV[1]} with cracked key #{cracked_key} and offset #{@offset}"
  end
end

crack = Crack.new
crack.run


# crack currently returns only cracked key; 
# needs to return cracked message as well
  # def self.crack(date_offset, message)
  #   key = 10000
  #   unencrypted_message = ""
  #   while unencrypted_message[-7..-1] != "..end.." do
  #     key += 1
  #     unencrypted_message = Rotator.decrypt(key, date_offset, message)
  #   end
  #   key
  # end
