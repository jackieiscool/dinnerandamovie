# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurants = Restaurant.create([

  { name: 'El Celler de Can Roca', description: 'Modern Spanish cuisine.', head_chef: 'Joan Roca', city: 'Girona', airport_code: 'GRO', country_display: 'Spain', country_code: 'ES', price: 150, movie: 9, website: 'www.cellercanroca.com', lat: 41.993144 , lng: 2.80793 } ,
  { name: 'Noma', description: "Mould-breaking Nordic food that takes nature's bounty to new levels", head_chef: 'Rene Redzepi', city: 'Copenhagen', airport_code: 'CPH', country_display: 'Denmark', country_code: 'DK', price: 210, movie: 13, website: 'http://noma.dk/', lat: 55.677933, lng: 12.596201 },
  { name: 'Osteria Francescana', description: "Modern Italian cuisine ", head_chef: 'Massimo Bottura', city: 'Modena', airport_code: 'BLQ', country_display: 'Italy', country_code: 'IT', price: 250, movie: 11, website: 'http://www.osteriafrancescana.it', lat: 44.644802 , lng: 10.921574 },
  { name: 'Mugaritz', description: "Techno-emotional Spanish", head_chef: 'Andoni Luis Aduriz', city: 'SAN SEBASTIAN', airport_code: 'EAS', country_display: 'Spain', country_code: 'ES', price: 200, movie: 9, website: 'mugaritz.com', lat: 43.272282, lng: -1.917127 },
  { name: 'Eleven Madison Park', description: "Modern French with a New York twist ", head_chef: 'Daniel Humm', city: 'New York', airport_code: 'JFK', country_display: 'USA', country_code: 'US', price: 225, movie: 12, website: 'elevenmadisonpark.com', lat: 40.738976, lng: -73.993259 },
  { name: 'D.O.M.', description: "Contemporary Brazilian Amazonian", head_chef: 'Geovane Carneiro ', city: 'SAO PAULO', airport_code: 'GRU', country_display: 'Brazil', country_code: 'BR', price: 200, movie: 11, website: 'domrestaurante.com.br', lat: -23.566290 , lng: -46.667402 },
  { name: 'Dinner by Heston Blumenthal', description: "Historical British food revived and reworked", head_chef: 'Ashley Palmer-Watts', city: 'London', airport_code: 'LHR', country_display: 'UK', country_code: 'GB', price: 300, movie: 17, website: 'dinnerbyheston.com', lat: 51.502396 , lng: -0.159960 },
  { name: 'Arzak', description: "Cutting-edge Basque", head_chef: 'Juan Mari Arzak', city: 'San Sebastian', airport_code: 'EAS', country_display: 'Spain', country_code: 'ES', price: 270, movie: 9, website: 'www.arzak.es', lat: 43.321422, lng: -1.949244 },
  { name: 'Steirereck', description: " Neo-Austrian with historical bent", head_chef: 'Heinz Reitbauer', city: 'Vienna', airport_code: 'VIE', country_display: 'Austria', country_code: 'AT', price: 140, movie: 11, website: 'steirereck.at/restaurant', lat: 48.206616, lng: 16.382010 },
  { name: 'Vendome', description: "Modern German", head_chef: 'Joachim Wissler', city: 'BERGISCH GLADBACH', airport_code: 'CGN', country_display: 'Germany', country_code: 'DE', price: 200, movie: 11, website: 'schlossbensberg.com', lat: 50.966203, lng: 7.161282 }

   ])

departures = Departure.create([
  { city: 'San Francisco', state: 'CA', country: 'USA', airport_code: 'SFO' }
  ])