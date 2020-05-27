class Activity < ApplicationRecord
  ACTIVITIES = ['Night Life', 'Beach', 'Nature', 'Food', 'Site Seeing', 'Sport', 'Classes', 'Next Destination', 'Culture', 'Music']
  VIBES = ['Chill', 'Pumped', 'Exploring', 'Fun', 'Heavy', 'Good Vibes Only']
  belongs_to :user
  has_many :users, through: :members
  has_many :members

  validates :title, :date, :description, :category, presence: true
  validates :category, inclusion: { in: ACTIVITIES }
  validates :vibe, inclusion: { in: VIBES }
  validates :title, length: { in: (1..25) }
  validates :description, length: { in: (1..100) }
end
