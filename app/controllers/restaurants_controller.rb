class RestaurantsController < ApplicationController
  def index
    restaurants = {}
    @data = Ean.hotel
  end
end
