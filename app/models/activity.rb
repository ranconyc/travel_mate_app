class Activity < ApplicationRecord
  include ActionView::Helpers::DateHelper
  include PgSearch::Model

  ACTIVITIES = ['Night Life', 'Nature', 'Food', 'Sport', 'Workshops', 'Travel', 'Culture']
  VIBES = ['Chill', 'Pump', 'Explore', 'Fun', 'Heavy', 'Good Vibes Only']

  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :messages, dependent: :destroy

  validates :title, :date, :description, :category, presence: true
  validates :category, inclusion: { in: ACTIVITIES }
  validates :vibe, inclusion: { in: VIBES }
  validates :title, length: { in: (1..25) }
  validates :description, length: { in: (1..100) }

  pg_search_scope :search_by_category, against: [:category]
  pg_search_scope :global_search,
    against: { title: 'A', description: 'B', location: 'B', category: 'C', vibe: 'D' },
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def spots_left
    num_spots_left = self.group_size - self.members.where(status: "accept").count
    if num_spots_left == 1
      return "1 spot left"
    elsif num_spots_left > 1
      return "#{num_spots_left} spots left"
    elsif num_spots_left == 0
      return "Full"
    end
  end

  def num_hours_ago
    time_string = time_ago_in_words(self.created_at) + " ago"
    if time_string.include? "about"
      time_string.gsub!(/about/, '')
    elsif time_string.include? "less than"
      time_string.gsub!(/less than/, '')
    end
    time_string.capitalize
  end

  def member?(user)
    users.include?(user)
  end
end
