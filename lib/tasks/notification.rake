include Rails.application.routes.url_helpers

namespace :notification do
  desc 'Sends SMS notification to employees asking them to log if they had overtime'

  task sms: :environment do
    if Date.today.sunday?
      employees = Employee.all
      notification_message = "Please confirm the overtime hours for last week.
                              https://covermyovertime.herokuapp.com.
                              Ignore this message if you have already done so"
      employees.each do |employee|
        AuditLog.create!(user: user, start_date: Date.tomorrow)
        SmsTool.send_sms(number: employee.phone_number, message: notification_message)
      end
    end
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
  end
end
