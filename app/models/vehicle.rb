class Vehicle < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
