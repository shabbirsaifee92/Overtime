class Post < ApplicationRecord

  validates :date, :rationale, :hours, presence: true
  validates :hours, numericality: { greater_than: 0.0 }
  belongs_to :user

  enum status: { default: 0, submitted: 1, approved: 2, rejected: 3 }

  scope :posts_by, ->(user) { where(user: user) }

  def update_audit_log
    audit_log = AuditLog.where(user: self.user, start_date: (self.date - 7.days..self.date)).last
    if self.submitted?
      audit_log.confirmed!
      audit_log.update_attribute(:end_date, Date.today)
    end
    if self.rejected?
      audit_log.pending!
      audit_log.update_attribute(:end_date, nil)
    end
  end
end
