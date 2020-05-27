class User < ApplicationRecord
  GENDER = ["Male", "Female", "Non-Binary"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :activities, dependent: :destroy

  validates :first_name, :age, :gender, presence: true
  validates :interest, inclusion: { in: Activity::ACTIVITIES }, allow_nil: true
  validates :gender, inclusion: { in: GENDER }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
