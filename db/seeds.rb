# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'creating restaurants and reviews...'
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{%w(London York Bristol).sample}",
    category: Restaurant::CATEGORY.sample,
    phone_number: "020 #{rand(1001..9000)} #{rand(1001..9000)}"
  )
  rand(1..5).times do
    review = Review.new(content: Faker::Restaurant.review, rating: rand(1..5))
    review.restaurant = restaurant
    review.save!
  end
  # restaurant.save!
end

puts 'finished'
