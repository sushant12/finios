# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
flights = []
100000.times do |i|
flights << Flight.new(
  code: Faker::Alphanumeric.alpha(number: 10),
  from: Faker::Address.country, 
  to: Faker::Address.country,
  date: Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
  price: Faker::Number.number(digits: 3),
  duration: rand(100),
  name: Faker::Company.name
  )
end
Flight.import flights
