class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  enum status: {
    pending: 0,
    validated: 1,
    refused: 2
  }
end
