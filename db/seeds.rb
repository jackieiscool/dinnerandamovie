# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurants = Restaurant.create([

  { name: 'El Celler de Can Roca', description: 'Modern Spanish cuisine.', head_chef: 'Joan Roca', city: 'Girona',airport_code: 'GRO', country_display: 'Spain', country_code: 'ESP', price: 150 , website: 'www.cellercanroca.com', lat: 41.993144 , lng: 2.80793 },
  { name: 'Noma', description: "Mould-breaking Nordic food that takes nature’s bounty to new levels", head_chef: 'René Redzepi', city: 'Copenhagen',airport_code: 'CPH', country_display: 'Denmark', country_code: 'DNK', price: 210, website: 'http://noma.dk/', lat: 55.677933, lng: 12.596201 },
  { name: 'Osteria Francescana', description: "Modern Italian cuisine ", head_chef: 'Massimo Bottura', city: 'Modena',airport_code: 'BLQ', country_display: 'Italy', country_code: '', price: 200, website: 'http://www.osteriafrancescana.it', lat: 44.644802 , lng: 10.921574 },
  # { id: 4,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 5,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 6,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 7,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 8,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 9,  name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },
  # { id: 10, name: '', description: " ", head_chef: '', city: '',airport_code: '', country_display: '', country_code: '', price: , website: '', lat: , lng: },

  ])

departures = Departure.create([
  { city: 'San Francisco', state: 'CA', country: 'USA', airport_code: 'SFO' }
  ])
