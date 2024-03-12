require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "has many bookings" do
    association = described_class.reflect_on_association(:bookings)
    expect(association.macro).to eq :has_many
  end

  it "returns user's full name" do
    user = User.new(first_name: "John", last_name: "Doe")
    expect(user.full_name).to eq "John Doe"
  end

  it "encrypts the password" do
    user = User.create(email: "test@example.com", password: "password")
    expect(user.encrypted_password).not_to eq "password"
  end
end
