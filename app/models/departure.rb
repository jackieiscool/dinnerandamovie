class Departure < ActiveRecord::Base
  attr_accessible :city, :state, :country, :airport_code
  has_many :flights
end
