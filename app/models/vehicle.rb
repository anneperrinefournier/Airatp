class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :name, :photo, :vehicle_type, :address, :passengers_capacity, :price_per_day, :cruising_speed, :fuel_type, :ecological_label, :description, presence: true

  validates :name, length: { minimum: 2 }
  validates :passengers_capacity, :price_per_day, :cruising_speed, numericality: true
  validates :ecological_label, inclusion: { in: %w[A B C D E F G] }
  validates :vehicle_type, inclusion: { in: %w[terrestrial maritime spatial aerial] }
  validates :description, length: { minimum: 25 }
end
