class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :restaurant_id
      t.integer :departure_id
      t.integer :price
      t.timestamps
    end
  end
end
