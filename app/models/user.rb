class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\d{3}\d{3}\d{4}/

  validates :first_name, :last_name, :phone_number, :ssn, :company, presence: true
  validates :phone_number, presence: true, length: { is: 10 }, format: { with: PHONE_REGEX }
  validates :ssn, length: { is: 4 }, numericality: {:greater_than_or_equal_to => 0}

  has_many :posts, dependent: :destroy
  has_many :audit_logs
  has_many :skills, dependent: :destroy

  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower

  def admin?
    admin_types.include?(self.type)
  end

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id).present?
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id, follower: self)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id, follower: self).destroy!
  end

  def update_followers_about_skill(skill_name)
    inform_followers(msg: "#{full_name} has a learned a new skill: #{skill_name}.")
  end

  private

  def admin_types
    ['AdminUser', 'Manager']
  end

  def inform_followers(msg: )
    followers.each do |follower|
      SmsTool.send_sms(number: follower.phone_number, message: msg)
    end
  end
end
