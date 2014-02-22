class RestaurantsController < ApplicationController
  def index
    departure_city = params[:departure]
    restaurants = {}
    @data = Ean.hotel

    render json: @data
  end
end
