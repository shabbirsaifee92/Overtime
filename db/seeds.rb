user = User.create(email: '123@test.com', password: 'password', password_confirmation: 'password', first_name: 'test', last_name: 'user')

puts "1 user  been create--------------------------"

User.create!(email: 'shabbirsaifee91@gmail.com', password: 'password', password_confirmation: 'password', first_name: 'shabbir', last_name: 'saifee', type: 'AdminUser')

puts '1 Admin User created---------------------------'

100.times do |post|
  Post.create(user: user, date: Date.today, rationale: "#{post} rational content")
end

puts "100 posts have been create--------------------------"