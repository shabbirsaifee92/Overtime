class Post < ApplicationRecord

  validates :date, :rationale, :hours, presence: true
  validates :hours, numericality: { greater_than: 0.0 }
  belongs_to :user

  enum status: { default: 0, submitted: 1, approved: 2, rejected: 3 }

  scope :posts_by, ->(user) { where(user: user) }
end
