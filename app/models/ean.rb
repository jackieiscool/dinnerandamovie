class Ean
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def self.hotels
    data = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      hotel = Expedia.hotel city
      restaurant.hotel =
      { name: hotel["name"],
        price: hotel["highRate"]
      }
      restaurant.flight = 200
      data << restaurant
    end
    data
  end

  def self.hotel(city)
    api = Expedia::Api.new
    response = api.get_list({city: city, sort: "QUALITY", NumberOfResults: 1})
    if response.exception?
      false
    else
      response.body["HotelListResponse"]["HotelList"]["HotelSummary"].first
    end

  end

end
