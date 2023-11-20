class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :address
      t.integer :passengers_capacity
      t.float :price_per_day
      t.float :cruising_speed
      t.string :fuel_type
      t.string :ecological_label
      t.text :description

      t.timestamps
    end
  end
end
