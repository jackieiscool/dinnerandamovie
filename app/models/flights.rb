class Flights < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :restaurant
  belongs_to :departure
end
