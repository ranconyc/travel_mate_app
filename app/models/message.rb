class Message < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :user, :activity, :content, presence: true
end
