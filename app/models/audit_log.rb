class AuditLog < ApplicationRecord
  belongs_to :user
  validates :start_date, :status, presence: true

  after_initialize :set_defaults


  private

  def set_defaults
    self.start_date ||= Date.today - 6.days
  end
end
