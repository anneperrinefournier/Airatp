class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :vehicle, dependent: :destroy

  enum status: {
    pending: 0,
    validated: 1,
    refused: 2
  }
end
