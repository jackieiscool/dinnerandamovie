class Ean
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def self.hotels(restaurants)


  end

  def self.hotel
    api = Expedia::Api.new
    response = api.get_list({city: "Seattle"})
    # binding.pry
    if response.exception?
      false
    else
      response.body["HotelListResponse"]["HotelList"]["HotelSummary"]
    end

  end

end
