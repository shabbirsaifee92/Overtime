FactoryBot.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
    first_name 'Jon'
    last_name 'Snow'
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
    first_name 'Admin'
    last_name 'User'
  end
end