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
    phone_number '9876543210'
    ssn 1234
    company 'ABC company'
    # manager
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
    first_name 'Admin'
    last_name 'User'
    phone_number '9876543210'
    ssn 1234
    company 'ABC company'
  end

  factory :another_user, class: 'User' do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
    first_name 'Unauthorized'
    last_name 'User'
    phone_number '9876543210'
    ssn 1234
    company 'ABC company'
  end

  factory :manager, class: 'Manager' do
    email { generate :email }
    password 'password'
    password_confirmation 'password'
    first_name 'Manager'
    last_name 'User'
    phone_number '9876543210'
    ssn 1234
    company 'ABC company'
  end
end