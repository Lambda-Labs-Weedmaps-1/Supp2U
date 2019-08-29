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

    @user_id = 0
10.times do |i|
    @user_id += 1
    name       = Faker::Company.name
    zipCode    = Faker::Address.zip_code
    city       = Faker::Address.city
    street     = Faker::Address.street_address + " " + Faker::Address.street_name
    state      = Faker::Address.state
    lat        = Faker::Address.latitude
    long       = Faker::Address.longitude
Business.create!(
    user_id: @user_id,
    name: name,
    website: "www.CarlsJr.com",
    city: city,
    state: state,
    street: street,
    zipcode: zipCode,
    theme: "OSFA",
    description: "making people unhealthy, one product at a time.",
    hours: "8am - 5pm",
    lat: lat,
    long: long
)
end

@business_id = 0
10.times do |i|
    @business_id += 1
    name = Faker::Company.bs
Menu.create!(
    business_id: @business_id,
    name: name
)
end

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

10.times do |i|
    item_name = Faker::Commerce.product_name
    price = Faker::Commerce.price
Item.create!(
    menu_id: 2,
    item_name: item_name,
    price: price,
    category: "Breakfast, Lunch and Dinner."
)
end

10.times do |i|
    item_name = Faker::Commerce.product_name
    price = Faker::Commerce.price
Item.create!(
    menu_id: 3,
    item_name: item_name,
    price: price,
    category: "Breakfast, Lunch and Dinner."
)
end