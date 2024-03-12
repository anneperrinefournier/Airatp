class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :vehicles, dependent: :destroy

  has_one_attached :photo, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
