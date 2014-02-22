class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :head_chef
      t.string :city
      t.string :airport_code
      t.string :country_display
      t.string :country_code
      t.integer :price
      t.string :website
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
