module SmsTool

  def self.send_sms(number:, message:)
    puts 'Sending SMS......'
    puts "#{message} #{number}"
  end
end