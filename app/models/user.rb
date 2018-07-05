class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\d{3}\d{3}\d{4}/

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, presence: true, length: { is: 10 }, format: { with: PHONE_REGEX }



  has_many :posts
  has_many :audit_logs
  def admin?
    admin_types.include?(self.type)
  end

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  private

  def admin_types
    ['AdminUser', 'Manager']
  end
end
