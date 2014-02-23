class Ean
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def self.hotels(airport_code)
    data = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      hotel = self.hotel restaurant
      hotel =
      { name: hotel["name"],
        price: hotel["highRate"]
      }
      departure = Departure.find_by_airport_code(airport_code.upcase)
      flight = Flight.find_by_restaurant_id_and_departure_id(restaurant.id, departure.id).try(:attributes)
      restaurant[:movie] = 10
      restaurant_json = restaurant.attributes.merge!({flight: flight, hotel: hotel})
      data << restaurant_json
    end
    data
  end

  def self.hotel(restaurant)
    api = Expedia::Api.new
    response = api.get_list({latitude: restaurant.lat, longitude: restaurant.lng, sort: "QUALITY", NumberOfResults: 1})
    if response.exception?
      false
    else
      response.body["HotelListResponse"]["HotelList"]["HotelSummary"].first
    end

  end

end
