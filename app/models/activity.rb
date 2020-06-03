class Activity < ApplicationRecord
  include ActionView::Helpers::DateHelper
  include PgSearch::Model

  ACTIVITIES = ['Food', 'Travel', 'Culture', 'Nature', 'Sport', 'Workshops', 'Night Life']
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

  def spots_left_new
    num_spots_left = self.group_size - self.members.where(status: "accept").count
    if num_spots_left == 1
      return "1/#{group_size} spot left"
    elsif num_spots_left > 1
      return "#{num_spots_left}/#{group_size} spots left"
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

  def getDateRepresentation
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    date_arr = self.date.to_s.split('-')
    month = months[date_arr[1].to_i - 1]
    day = date_arr[2].to_i
    if day == 1 || day == 31
      dayStr = "#{day}st"
    elsif day == 2 || day == 22
      dayStr = "#{day}nd"
    elsif day == 3 || day == 23
      dayStr = "#{day}rd"
    else
      dayStr = "#{day}th"
    end
    return "#{month} #{dayStr}, #{date_arr[0]}"
  end
end
