class Restaurant < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :flights
end
