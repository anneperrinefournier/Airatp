class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :vehicle, dependent: :destroy

  enum status: {
    pending: 0,
    validated: 1,
    refused: 2
  }

  def self.status_color_class(status)
    case status.to_sym
    when :pending
      "text-grey"
    when :validated
      "text-green"
    when :refused
      "text-red"
    else
      ""
    end
  end

  attribute :number_of_days, :integer
end
