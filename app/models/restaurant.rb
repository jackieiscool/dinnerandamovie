class Restaurant < ActiveRecord::Base
  attr_accessible :id, :name, :description, :head_chef, :city, :airport_code, :country_display, :country_code, :price, :website, :lat, :lng
  has_many :flights
end
