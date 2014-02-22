class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :head_chef
      t.string :city
      t.string :country_display
      t.string :country_code
      t.integer :price
      t.string :website
      t.integer :lat
      t.integer :lon
      t.timestamps
    end
  end
end
