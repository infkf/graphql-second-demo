# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

global = User.create(handle: 'global', bio: 'Twitter for everyone to tweet', password: 'password123', password_confirmation: 'password123')
admin = User.create(handle: 'admin', bio: 'I am the admin of this Konoha', password: 'password123',
                    password_confirmation: 'password123')
popular_girl = User.create(handle: 'popular_girl', bio: 'I am better than you', password: 'password123',
                           password_confirmation: 'password123')
sportsman = User.create(handle: 'sportsman', bio: 'Go Team!', password: 'password123',
                        password_confirmation: 'password123')

admin.follow(popular_girl.id)
sportsman.follow(popular_girl.id)
popular_girl.follow(sportsman)

3.times do
  admin.tweet(Faker::Movies::HarryPotter.quote)
end

3.times do
  sportsman.tweet(Faker::Movies::HarryPotter.quote)
end

3.times do
  popular_girl.tweet(Faker::Movies::HarryPotter.quote)
end

100.times do
  popular_girl.tweet(Faker::Movies::HarryPotter.quote)
  sportsman.tweet(Faker::Movies::HarryPotter.quote)
  admin.tweet(Faker::Movies::HarryPotter.quote)
  global.tweet(Faker::Quotes::Rajnikanth.joke)
end
