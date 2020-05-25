class Activity < ApplicationRecord
  belongs_to :user
  has_many :users, through: :members
  has_many :members
end
