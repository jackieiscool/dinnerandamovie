class RestaurantsController < ApplicationController
  def index
    departure_city = params[:departure]
    @data = Ean.hotels(departure_city)
    render json: @data
  end
end
