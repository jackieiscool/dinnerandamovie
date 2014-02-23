require 'nokogiri'
require 'open-uri'
require 'pry'
require 'capybara'
require 'capybara/poltergeist'
require 'capybara/dsl'

module CapybaraWithPhantomJs
  include Capybara::DSL
 
  # Create a new PhantomJS session in Capybara
  def new_session
    # Register PhantomJS (aka poltergeist) as the driver to use
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app)
    end

    Capybara.current_driver = :poltergeist
    # Capybara.javascript_driver = :poltergeist
 
    Capybara.app_host = "http://www.expedia.com"

    # Use XPath as the default selector for the find method
    Capybara.default_selector = :xpath
 
    # Start up a new thread
    @session = Capybara::Session.new(:poltergeist)
 
    # Report using a particular user agent
    @session.driver.headers = { 'User-Agent' =>
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36" }
 
    # Return the driver's session
    @session
  end

  def session
    @session ||= new_session
  end
 
  # Returns the current session's page
  def html
    page.html
  end
end

class ExpediaScrapper
  include CapybaraWithPhantomJs

  AIRPORTS = {
    "Girona, Spain" => "GRO", 
    "Copenhagen, Denmark" => "CPH", 
    "Bologna, Italy" =>  "BLQ",
    "San Sebastian, Spain" => "EAS",
    "New York, United States" => "JFK",
    "Sau Paulo, Brazil" => "GRU",
    "London, United Kingdom" => "LHR",
    "Vienna, Austria" => "VIE",
    "Cologne, Germany" =>  "CGN",
    "San Francisco, United States" => "SFO"
  }

  def initialize(start_city, end_city)
    @date = Date.today.month.to_s + "/" + Date.today.day.to_s + "/" + Date.today.year.to_s
    @start_city = start_city.gsub(/\s/, "%20")
    @end_city = end_city.gsub(/\s/, "%20")
    @start_code = AIRPORTS[start_city]
    @end_code = AIRPORTS[end_city]
    @tomorrow = (Date.today + 1.day).month.to_s + "/" + (Date.today + 1.day).day.to_s + "/" + (Date.today + 1.day).year.to_s
  end

  def url
    @url ||= "http://www.expedia.com/Flights-Search?trip=roundtrip&leg1=from:#{@start_city}(#{@start_code}),to:#{@end_city}(#{@end_code}),departure:#{@date}TANYT&leg2=from:#{@end_city}(#{@end_code}),to:#{@start_city}(#{@end_code}),departure:#{@tomorrow}TANYT&passengers=children:0,adults:1,seniors:0,infantinlap:Y&mode=search"
  end

  def expedia_page
    unless @expedia_page
      new_session
      visit(url)
      sleep 15 # give phantomjs 5 seconds and let the page fill itself in
      @expedia_page = Nokogiri::HTML.parse(html)
    end
    @expedia_page
  end
end

namespace :airports do
  task :setup  => :environment do

    departures = Departure.all
    restaurants = Restaurant.all

    departures.each do |departure|

      restaurants.each do |restaurant|

        start_city = departure.city + ", " + departure.country
        end_city = restaurant.city + ", " + restaurant.country_display

        begin

          e = ExpediaScrapper.new(start_city, end_city)
          stuff = e.expedia_page
          info = stuff.css('#flightModule0')
          location = info.css('.location')
          depart_time = location.first.children[1].text
          price = info.css('.dollars').text.gsub(/\$|,/, "").to_i

          Flight.create(restaurant_id: restaurant.id , departure_id: departure.id, price: price, leaving_at: depart_time, url: e.url)  
        
        rescue
           p "Something went wrong"

        ensure
          p "Things are working"

        end
      end
    end
  end
end

