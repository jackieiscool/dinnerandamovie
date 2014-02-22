class RestaurantsController < ApplicationController
  def index
    departure_city = params[:departure]
    restaurants = {}
    @data = Ean.hotels

    render json: @data
  end
end
