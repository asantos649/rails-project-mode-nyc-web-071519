# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserConcert.destroy_all
Performance.destroy_all
User.destroy_all
Band.destroy_all
Concert.destroy_all

user1 = User.create(name: "Bruce Jr.", email: "bruce@jr.com")
user2 = User.create(name: "Amanda Hugenkiss", email: "amandahugenkiss@gmail.com")

band1 = Band.create(name: "The Beatles")
band2 = Band.create(name: "Elvis Presley")

concert1 = Concert.create(date_and_time: Time.now, name: "The Beatles: Back from the Dead", location: "New York City")
concert2 = Concert.create(date_and_time: Time.now, name: "Elvis Presley: Back from the Dead 2: Electric Boogaloo", location: "Los Angeles")

user_concert1 = UserConcert.create(user: user1, concert: concert1)
user_concert2 = UserConcert.create(user: user2, concert: concert2)

performance1 = Performance.create(band: band1, concert: concert1, opener: false)
performance2 = Performance.create(band: band2, concert: concert2, opener: false)