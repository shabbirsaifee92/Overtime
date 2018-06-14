class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\d{3}\d{3}\d{4}/

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, presence: true, length: { is: 10 }, format: { with: PHONE_REGEX }



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
