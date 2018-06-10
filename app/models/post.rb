class Post < ApplicationRecord

  validates :date, :rationale, presence: true
  belongs_to :user

  enum status: { default: 0, submitted: 1, approved: 2, rejected: 3 }
end
