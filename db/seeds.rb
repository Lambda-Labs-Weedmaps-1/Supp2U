# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
    username    = Faker::Internet.user_name
    email       = Faker::Internet.email
    password    = Faker::Internet.password
User.create!(
        username:       username ,
        email:          email,
        password:       password
    )
end

Business.create!(
    user_id: 1,
    name: "Carls Jr.",
    website: "www.CarlsJr.com",
    city: "Simi Valley",
    state: "California",
    street: "2034 Valley Terrace Dr",
    zipcode: 90635,
    theme: "fast food",
    description: "making people unhealthy, one product at a time.",
    hours: "8am - 5pm"
)

Menu.create!(
    business_id: 1,
    name: "Burger Menu"
)

10.times do |i|
    item_name = Faker::Commerce.product_name
    price = Faker::Commerce.price
Item.create!(
    menu_id: 1,
    item_name: item_name,
    price: price,
    category: "Breakfast, Lunch and Dinner."
)
end