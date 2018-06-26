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

  desc 'Sends Email notification to managers(admin users) each day to inform pending overtime requests'

  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.present?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  # 1. Iterate over pending(submitted) overtime requests
  # 2. Check to see if there are requests
  # 3. iterate over the list of admin users/manager
  # 4. send email to each admin
  end
end
