# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#Chicago Neighborhoods: Lincoln Park, Chinatown, River North, Logan Square, Englewood, Austin, Riverdale, Humboldt Park, Hyde Park, South Chicago, Wicker Park, West Englewood, Oakland,  
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'betterlorem'

20.times do
    User.create(
        name: Faker::Name.unique.name, 
        username: Faker::Internet.unique.username, 
        password: "password"
    )
end

User.create(name: "Pat Bosman", username: "bosmanpa", password: "password")
User.create(name: "Janae Hall", username: "janaeelisa", password: "password")

tag_array = ['active', 'affectionate', 'calm', 'cuddly', 'curious', 'friendly', 'gentle', 'greedy', 'grumpy', 'kid-friendly', 'lazy', 'long-haired', 'naughty', 'part-dog', 'purrfect', 'regal', 'sensitive', 'short-haired','shy', 'spoiled rotten', 'timid']

tag_array.each do |tag|
    Tag.create(name: tag)
end

neighborhood_array = ['Lincoln Park', 'Chinatown', 'River North', 'Logan Square', 'Englewood', 'Austin', 'Riverdale', 'Humboldt Park', 'Hyde Park', 'South Chicago', 'Wicker Park', 'West Englewood', 'Oakland']

20.times do
    Cat.create(
        owner_id: Faker::Number.between(from: 1, to: 20),
        name: Faker::Creature::Cat.unique.name,
        breed: Faker::Creature::Cat.breed,
        price: Faker::Number.within(range: 50..200),
        neighborhood: neighborhood_array.sample,
        tag_ids: [Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21)].uniq
    )
end

Cat.create(owner_id: 21, name: Faker::Creature::Cat.unique.name, breed: Faker::Creature::Cat.breed, price: Faker::Number.within(range: 50..200), neighborhood: neighborhood_array.sample, tag_ids: [Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21)].uniq)
Cat.create(owner_id: 21, name: Faker::Creature::Cat.unique.name, breed: Faker::Creature::Cat.breed, price: Faker::Number.within(range: 50..200), neighborhood: neighborhood_array.sample, tag_ids: [Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21)].uniq)
Cat.create(owner_id: 22, name: Faker::Creature::Cat.unique.name, breed: Faker::Creature::Cat.breed, price: Faker::Number.within(range: 50..200), neighborhood: neighborhood_array.sample, tag_ids: [Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21)].uniq)
Cat.create(owner_id: 22, name: Faker::Creature::Cat.unique.name, breed: Faker::Creature::Cat.breed, price: Faker::Number.within(range: 50..200), neighborhood: neighborhood_array.sample, tag_ids: [Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21), Faker::Number.within(range: 1..21)].uniq)

50.times do
    Reservation.create(
        cat_id: Faker::Number.within(range: 1..9),
        renter_id: Faker::Number.within(range: 1..20),
        date: Faker::Date.between(from: Date.today, to: 1.year.from_now)
    )
end

Reservation.create(cat_id: 21, renter_id: 22, date: Faker::Date.between(from: 1.year.ago, to: Date.today))
Reservation.create(cat_id: 22, renter_id: 22, date: Faker::Date.between(from: 1.year.ago, to: Date.today))
Reservation.create(cat_id: 23, renter_id: 21, date: Faker::Date.between(from: 1.year.ago, to: Date.today))
Reservation.create(cat_id: 24, renter_id: 21, date: Faker::Date.between(from: 1.year.ago, to: Date.today))

n = 1
until n == 51 do
    CatReview.create(
        reservation_id: n,
        rating: Faker::Number.within(range: 1..5),
        review: BetterLorem.p(1, true)
    )
    n += 1
end

i = 1
until i == 51 do
    RenterReview.create(
        reservation_id: i,
        rating: Faker::Number.within(range: 1..5),
        review: BetterLorem.p(1, true)
    )
    i += 1
end
