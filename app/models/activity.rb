class Activity < ApplicationRecord
  include ActionView::Helpers::DateHelper

  ACTIVITIES = ['Night Life', 'Beach', 'Nature', 'Food', 'Site Seeing', 'Sports', 'Classes', 'Next Destination', 'Culture', 'Music']
  VIBES = ['Chill', 'Pump', 'Explore', 'Fun', 'Heavy', 'Good Vibes Only']

  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :title, :date, :description, :category, presence: true
  validates :category, inclusion: { in: ACTIVITIES }
  validates :vibe, inclusion: { in: VIBES }
  validates :title, length: { in: (1..25) }
  validates :description, length: { in: (1..100) }

  def spots_left
    if members.length < group_size
      if group_size - members.length == 1
        return "1 spot left"
      end
      return "#{group_size - members.length} spots left"
    elsif members.length == group_size
      return "Full"
    end
  end

  def num_hours_ago
    time_string = time_ago_in_words(self.created_at) + " ago"
    time_string.capitalize!
    time_string.gsub(/About/, '')
  end
end
