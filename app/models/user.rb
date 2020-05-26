class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :activities, dependent: :destroy
  validates :first_name, :age, :gender, presence: true
  validates :gender, inclusion: { in: ["Male", "Female", "Non-Binary"] }
end


