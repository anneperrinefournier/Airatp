class UpdateForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :vehicles, :users
    remove_foreign_key :bookings, :users
    remove_foreign_key :bookings, :vehicles

    add_foreign_key :vehicles, :users, on_delete: :cascade
    add_foreign_key :bookings, :users, on_delete: :cascade
    add_foreign_key :bookings, :vehicles, on_delete: :cascade
  end
end
