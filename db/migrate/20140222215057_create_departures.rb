class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.string :city,
      t.string :state,
      t.string :country,
      t.string :airport_code
      t.timestamps
    end
  end
end
