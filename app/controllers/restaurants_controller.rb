class RestaurantsController < ApplicationController
  def index
    restaurants = {}
    @data = Ean.hotel

    render json: @data
  end
end
