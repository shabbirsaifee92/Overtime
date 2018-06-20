user = User.create(email: 'user@test.com',
                   password: 'password',
                   password_confirmation: 'password',
                   first_name: 'test',
                   last_name: 'user',
                   phone_number: '8572696189')

puts "1 user  been create--------------------------"

AdminUser.create!(email: 'admin@test.com',
                  password: 'password',
                  password_confirmation: 'password',
                  first_name: 'admin',
                  last_name: 'user',
                  phone_number: '8572696189')

puts '1 Admin User created---------------------------'

100.times do |post|
  Post.create(user: user, date: Date.today, rationale: "#{post} rational content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", hours: 2.5)
end

puts "100 posts have been create--------------------------"

100.times do |audit_log|
  AuditLog.create(user: user, start_date: Date.today - 6.days)
end

puts "100 audit logs have been create--------------------------"
