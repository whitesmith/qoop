# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.where(email: 'user@mail.com').first_or_create do |user|
  user.password = 'passw0rd'
  user.password_confirmation = 'passw0rd'
end

Meal.destroy_all
9.times.each do
  Meal.create(
    owner: User.last,
    title: 'Bacon',
    address: '0x123',
    description: 'Bacon muita bom, daquele!',
    max_people: 4,
    date: Date.tomorrow,
    place: 'Pixels Camp',
    image: File.new("#{Rails.root}/db/bacon.jpg", "r")
  )
end
