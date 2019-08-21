# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ticketmaster-sdk'

UserConcert.destroy_all
Performance.destroy_all
User.destroy_all
Band.destroy_all
Concert.destroy_all

# user1 = User.create(name: "Bruce Jr.", email: "bruce@jr.com")
# user2 = User.create(name: "Amanda Hugenkiss", email: "amandahugenkiss@gmail.com")

# band1 = Band.create(name: "The Beatles")
# band2 = Band.create(name: "Elvis Presley")
# band3 = Band.create(name: "Nickelback")

# concert1 = Concert.create(date_and_time: Time.now, name: "The Beatles: Back from the Dead", location: "New York City")
# concert2 = Concert.create(date_and_time: Time.now, name: "Elvis Presley: Back from the Dead 2: Electric Boogaloo", location: "Los Angeles")
# concert3 = Concert.create(date_and_time: Time.now, location: "New York City")

# user_concert1 = UserConcert.create(user: user1, concert: concert1)
# user_concert2 = UserConcert.create(user: user2, concert: concert2)

# performance1 = Performance.create(band: band1, concert: concert1, opener: false)
# performance2 = Performance.create(band: band2, concert: concert2, opener: false)
# performance3 = Performance.create(band: band1, concert: concert2, opener: false)
# performance4 = Performance.create(band: band3, concert: concert2, opener: false)
# performance5 = Performance.create(band: band1, concert: concert3, opener: false)

params = {size: 86, source: 'ticketmaster', classificationName: 'music'}
client = Ticketmaster.client(apikey: ENV['APIKEY'])
response = client.search_events(params: params)
events = response.results

# check if concert exists, if not create it in db
if events
events.each do |event|
    if event.venues[0] && event.dates["start"] && event.dates["start"]["dateTime"] && event.venues[0].state["stateCode"] && !!event.venues[0].state && !!event.venues[0].country && event.name && event.venues && event.venues[0].city && event.dates
        concert_params = {name: event.name, date_and_time: event.dates["start"]["dateTime"], location: "#{event.venues[0].city}, #{event.venues[0].state["stateCode"]} #{event.venues[0].country}"}
    Concert.find_by(concert_params) ? (concert = Concert.find_by(concert_params)) : (concert = Concert.create(concert_params))
    end
    attractions = event.attractions
    attractions.each do |attraction|
        if attraction && attraction.name
            Band.find_by(name: attraction.name) ? (band = Band.find_by(name: attraction.name)) :(band = Band.create(name: attraction.name))
            Performance.create(band: band, concert: concert)
        end
    end
end
end
# iterate events array to get attractions
# attractions = events.map{|event| event.attractions} #returns array of arrays

# iterate over attractions to get band name

# check if band exists, if not create it in db
# link together with performance



# def concert_location(venue)
#     "#{venue.city}, #{venue.state["stateCode"]} #{venue.country}"
# end