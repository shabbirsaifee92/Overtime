class Skill < ApplicationRecord
  validates :user, :name, presence: true

  belongs_to :user
end
