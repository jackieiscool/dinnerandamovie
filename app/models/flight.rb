class Flight < ActiveRecord::Base
  attr_accessible :departure_id, :restaurant_id, :price, :leaving_at, :url
  belongs_to :restaurant
  belongs_to :departure

  validates :price, presence: true
  validates :leaving_at, presence: true
  validates :departure_id, uniqueness: { scope: :restaurant_id }
end
