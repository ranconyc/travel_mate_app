class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many_attached :photos
  has_many :activities, dependent: :destroy

  validates :first_name, :age, :gender, presence: true
  validates :gender, inclusion: { in: ["Male", "Female", "Non-Binary"] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
