class AddColumnsToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :leaving_at, :string
    add_column :flights, :url, :text
  end
end
