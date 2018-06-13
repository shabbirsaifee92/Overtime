FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'rationale'
    hours 2.5
    user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'second post content'
    hours 0.5
    user
  end
end