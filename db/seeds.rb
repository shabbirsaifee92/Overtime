manager = Manager.create(email: 'ssaifee.manager@test.com',
                         password: 'password',
                         password_confirmation: 'password',
                         first_name: 'manager',
                         last_name: 'user',
                         phone_number: '8572696189',
                         ssn: 1234,
                         company: 'ABC company')
puts "1 Manager created--------------------------"

employee = Employee.create(email: 'ssaifee.user@test.com',
                   password: 'password',
                   password_confirmation: 'password',
                   first_name: 'test',
                   last_name: 'user',
                   phone_number: '8572696189',
                   manager: manager,
                   ssn: 1234,
                   company: 'ABC company')

puts "1 Employee created--------------------------"

AdminUser.create!(email: 'ssaifee.admin@maildrop.cc',
                  password: 'password',
                  password_confirmation: 'password',
                  first_name: 'admin',
                  last_name: 'user',
                  phone_number: '8572696189',
                  ssn: 1234,
                  company: 'ABC company')

puts '1 Admin User created---------------------------'

10.times do |post|
  Post.create(user: employee, date: Date.today, rationale: "#{post} rational content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", hours: 2.5)
end

puts "10 posts have been create--------------------------"

AuditLog.create(user: employee, start_date: Date.today - 6.days)
AuditLog.create(user: employee, start_date: Date.today - 13.days)
AuditLog.create(user: employee, start_date: Date.today - 20.days)

puts "3 audit logs have been create--------------------------"

8.times do |card|
  Card.create(name: 'CEN-XXXX', card_type:0, points:1, description: 'pebble' )
end

3.times do |card|
  Card.create(name: 'CEN-XXXX', card_type:1, points:1, description: 'spike' )
end

2.times do |card|
  Card.create(name: 'CEN-XXXX', card_type:2, points:3, description: 'bug' )
end

5.times do |card|
  Card.create(name: 'CEN-XXXX', card_type:3, points:3, description: 'task' )
end

puts "20 cards have been created--------------------------"


Skill.create(name: 'ruby on rails')
Skill.create(name: 'elixir')
Skill.create(name: 'html5')

Skill.create(name: 'ruby on rails', created_at: Date.today - 1.month)
Skill.create(name: 'elixir', created_at: Date.today - 1.month)

Skill.create(name: 'ruby on rails', created_at: Date.today - 2.months)
Skill.create(name: 'elixir', created_at: Date.today - 2.months)
Skill.create(name: 'html5', created_at: Date.today - 2.months)

Skill.create(name: 'html5', created_at: Date.today - 3.months)


puts "3 skills have been created--------------------------"