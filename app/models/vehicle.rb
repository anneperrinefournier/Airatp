class Vehicle < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_one_attached :photo

  validates :name, :photo, :vehicle_type, :address, :passengers_capacity, :price_per_day, :cruising_speed, :fuel_type, :ecological_label, :description, presence: true

  validates :name, length: { minimum: 2 }
  validates :passengers_capacity, :price_per_day, :cruising_speed, numericality: true
  validates :ecological_label, inclusion: { in: %w[A B C D E F] }
  validates :vehicle_type, inclusion: { in: %w[terrestrial maritime spatial aerial] }
  validates :description, length: { minimum: 25 }
end
