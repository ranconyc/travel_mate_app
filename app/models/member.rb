class Member < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :status, inclusion: { in: ["accept", "reject", "pending"] }

  def getFullName
    "#{self.user.first_name} #{self.user.last_name}"
  end
end
