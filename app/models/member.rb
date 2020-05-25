class Member < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :status, inclusion: { in: ["accept", "reject", "pending"] }
end
