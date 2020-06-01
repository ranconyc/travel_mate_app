require "open-uri"

class User < ApplicationRecord
  before_create :set_default_avatar

  GENDER = ["Male", "Female", "Non-Binary"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :activities, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages

  validates :first_name, :date_of_birth, :gender, presence: true
  validates :interest, inclusion: { in: Activity::ACTIVITIES }, allow_nil: true
  validates :gender, inclusion: { in: GENDER }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_avatar
    default_avatar = URI.open("https://res.cloudinary.com/dlr2wvlnj/image/upload/v1590592032/default_avatar_nxiuyf.png")
    unless self.avatar.attached?
      self.avatar.attach(io: default_avatar, filename: "default_avatar.png", content_type: 'image/png')
    end
  end

  def age
    now = Time.now.utc.to_date
    dob = date_of_birth

    is_later_month = (now.month > dob.month ||
      (now.month == dob.month && now.day >= dob.day))

    now.year - dob.year - (is_later_month ? 0 : 1)
  end
end
