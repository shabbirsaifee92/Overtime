class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :posts

  def admin?
    admin_types.include?(self.type)
  end

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end

  private

  def admin_types
    ['AdminUser']
  end
end
