FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'rationale'
    user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'second post content'
    user
  end
end