class Activity < ApplicationRecord
  ACTIVITIES = ['Night Life', 'Beach', 'Nature', 'Food', 'Site Seeing', 'Sports', 'Classes', 'Next Destination', 'Culture', 'Music']
  # CATEGORIES = ['Night Life', 'Beach', 'Nature', 'Food', 'Site Seeing', 'Sports', 'Classes', 'Next Destination', 'Culture', 'Music']
  VIBES = ['Chill', 'Pump', 'Explore', 'Fun', 'Heavy', 'Good Vibes Only']
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members


  validates :title, :date, :description, :category, presence: true
  validates :category, inclusion: { in: ACTIVITIES }
  validates :vibe, inclusion: { in: VIBES }
end
