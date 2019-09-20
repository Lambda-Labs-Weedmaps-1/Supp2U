# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require_relative './schwifty.rb'
require 'yaml'

get_schwifty = YAML.load(File.read('schwifty.yml'))

def fetch_image(instance, search)
  url = "https://pixabay.com/api/?key=13687146-57344923f31576e6d7f7b17a2&category=food&q=#{URI.encode(search.to_s)}"
  res = Faraday.get(url)
  data = JSON.parse(res.body)
  hits = data['hits'].present? ? data['hits'] : nil

  max_count = hits.present? ? hits.count.to_i : 0
  # puts max_count
  image = max_count > 0 ? hits[rand(0...max_count) || 0]['largeImageURL'] : nil
  puts max_count

  if image.present?
    downloaded_image = open(image)
    instance.image.attach(io: downloaded_image, filename: "#{search.to_s}.jpg")
  end
  puts "Done searching #{search.to_s}, which resulted in #{image}"
end

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

# 100 businesses with user_ids 1-100
(1..100).each do |i|
  business =
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
  fetch_image(business, business.theme)
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

# 100 menus with business_id 1-100
(1..100).each { |i| Menu.create!(business_id: i, name: Faker::Company.bs) }

# Cleanup Existing Customer Data
Customer.delete_all

# 100 customers with user_ids 101-200
(101..200).each do |i|
  customer = Customer.create!(user_id: i, custname: Faker::DcComics.name)
  # fetch_image(customer, customer.custname)
end

# Cleanup Existing Item Data
Item.delete_all

(1..100).each do |i|
  # add more calls to create for additional menu items
  # number of .create calls == number of items per menu
  # 8 menu items per menu currently
  item_1 =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )

  fetch_image(item_1, item_1.item_name)

  item_2 =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 1..10),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item_2, item_2.item_name)

  item =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item, item.item_name)
  item =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item, item.item_name)

  item =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item, item.item_name)
  item =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item, item.item_name)

  item =
    Item.create!(
      menu_id: i,
      description: Faker::Food.description,
      item_name: Faker::Food.dish,
      price: Faker::Commerce.price,
      inventory: Faker::Number.within(range: 100..200),
      category: Faker::Restaurant.type,
      cals: Faker::Number.within(range: 1..1_400)
    )
  fetch_image(item, item.item_name)
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

