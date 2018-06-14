namespace :notification do
  desc 'Sends SMS notification to employees asking them to log if they had overtime'

  task sms: :environment do
    # 1. Schedule Sunday as 5:00 PM
    # 2. Iterate over all employees
    # 3. Skip admin users
    # 4. Send a message that has instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms(number: , message: '')
    # end
  end
end
