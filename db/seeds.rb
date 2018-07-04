employee = Employee.create(email: 'ssaifee.user@test.com',
                   password: 'password',
                   password_confirmation: 'password',
                   first_name: 'test',
                   last_name: 'user',
                   phone_number: '8572696189')

puts "1 Employee created--------------------------"

AdminUser.create!(email: 'ssaifee.admin@maildrop.cc',
                  password: 'password',
                  password_confirmation: 'password',
                  first_name: 'admin',
                  last_name: 'user',
                  phone_number: '8572696189')

puts '1 Admin User created---------------------------'

10.times do |post|
  Post.create(user: employee, date: Date.today, rationale: "#{post} rational content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", hours: 2.5)
end

puts "10 posts have been create--------------------------"

AuditLog.create(user: employee, start_date: Date.today - 6.days)
AuditLog.create(user: employee, start_date: Date.today - 13.days)
AuditLog.create(user: employee, start_date: Date.today - 20.days)

puts "3 audit logs have been create--------------------------"
