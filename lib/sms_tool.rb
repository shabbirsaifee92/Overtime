module SmsTool

  def self.send_sms(number:, message:)
    puts 'Sending SMS......'
    puts "#{message} #{number}"

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
                       from: ENV['TWILIO_PHONE_NUMBER'],
                       to: "+91#{number}",
                       body: "#{message}"
    )
  end
end