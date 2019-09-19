# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require_relative './schwifty.rb'
require 'yaml'
get_schwifty = YAML.load(File.read('schwifty.yml'))

# Cleanup Existing User Data
User.delete_all

(1..200).each do |_|
  User.create!(
    username: Faker::Internet.unique.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Cleanup Existing Business Data
Business.delete_all

# 110 businesses with user_ids 1-110
(1..100).each do |i|
  Business.create!(
    user_id: i,
    name: Faker::Restaurant.unique.name,
    website: Faker::Internet.url,
    city: 'Denver',
    state: 'CO',
    street: get_schwifty[i][:street],
    zipcode: get_schwifty[i][:zip],
    theme: Faker::Restaurant.type,
    description: Faker::Restaurant.description,
    lat: get_schwifty[i][:lat],
    long: get_schwifty[i][:long]
  )
end

Schedule.delete_all

(1..100).each do |i|
  Schedule.create!(
    business_id: i,
    monday: '8:00 AM',
    tuesday: '8:00 AM',
    wednesday: '8:00 AM',
    thursday: '8:00 AM',
    friday: '8:00 AM',
    saturday: '12:00 PM',
    sunday: 'Closed'
  )
end

# Cleanup Existing Menu Data
Menu.delete_all

# 110 menus with business_id 1-110
(1..100).each { |i| Menu.create!(business_id: i, name: Faker::Company.bs) }

# Cleanup Existing Customer Data
Customer.delete_all

# 111 customers with user_ids 111- 1100
(101..200).each do |i|
  Customer.create!(user_id: i, custname: Faker::DcComics.name)
end

# Cleanup Existing Item Data
Item.delete_all

(1..100).each do |i|
  # add more calls to create for additional menu items
  # number of .create calls == number of items per menu
  # 8 menu items per menu currently
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
  Item.create!(
    menu_id: i,
    description: Faker::Food.description,
    item_name: Faker::Food.dish,
    price: Faker::Commerce.price,
    inventory: Faker::Number.within(range: 1..10),
    category: Faker::Restaurant.type,
    cals: Faker::Number.within(range: 1..1_400)
  )
end

# Customers that need to leave a review []

(1..100).each do |j|
  Review.create!(
    customer_id: j,
    business_id: Faker::Number.within(range: 1..100),
    review: Faker::Restaurant.review,
    rating: Faker::Number.within(range: 1..5)
  )

  Review.create!(
    customer_id: j,
    business_id: Faker::Number.within(range: 1..100),
    review: Faker::Restaurant.review,
    rating: Faker::Number.within(range: 1..5)
  )

  Review.create!(
    customer_id: j,
    business_id: Faker::Number.within(range: 1..100),
    review: Faker::Restaurant.review,
    rating: Faker::Number.within(range: 1..5)
  )

  Review.create!(
    customer_id: j,
    business_id: Faker::Number.within(range: 1..100),
    review: Faker::Restaurant.review,
    rating: Faker::Number.within(range: 1..5)
  )
end
