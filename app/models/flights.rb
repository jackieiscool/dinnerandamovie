class Flights < ActiveRecord::Base
  attr_accessible :departure_id, :restaurant_id, :price
  belongs_to :restaurant
  belongs_to :departure
end
