# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Todo real addresses street, zip, lat - long in a hash
real_places = {
	1 => {
		street: '200 Fillmore Street',
		zip: 80_206,
		lat: '39.7197500000',
		long: '-104.9533472222'
	},
	2 => {
		street: '1201 East Colfax Avenue',
		zip: 80_218,
		lat: '39.7401111111',
		long: '-104.9717555556'
	},
	3 => {
		street: '7655 West Alameda Avenue',
		zip: 80_226,
		lat: '39.7116700000',
		long: '-105.0824200000'
	},
	4 => {
		street: '846 Broadway',
		zip: 80_203,
		lat: '39.7299500000',
		long: '-104.9873805556'
	},
	5 => {
		street: '17001 Lincoln Avenue',
		zip: 80_134,
		lat: '39.5361583333',
		long: '-104.7922444444'
	},
	6 => {
		street: '18901 East Mainstreet',
		zip: 80_134,
		lat: '39.5187305556',
		long: '-104.7697916667'
	},
	7 => {
		street: '17001 Lincoln Avenue',
		zip: 80_134,
		lat: '39.5361583333',
		long: '-104.7922444444'
	},
	8 => {
		street: '3400 Navajo Street',
		zip: 80_211,
		lat: '39.7645611111',
		long: '-105.0039361111'
	},
	9 => {
		street: '3160 Tejon Street',
		zip: 80_211,
		lat: '39.5361583333',
		long: '-104.7922444444'
	},
	10 => {
		street: '1919 Blake Street',
		zip: 80_202,
		lat: '39.7538500000',
		long: '-104.9953900000'
	}
}

# Cleanup Existing User Data
User.delete_all

(1..15).each do |i|
	User.create!(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: Faker::Internet.password
	)
end

# Cleanup Existing Business Data
Business.delete_all

# 5 businesses with user_ids 1-5
(1..10).each do |i|
	Business.create!(
		user_id: i,
		name: Faker::Restaurant.name,
		website: Faker::Internet.url,
		city: 'Denver',
		state: 'CO',
		street: real_places[i][:street],
		zipcode: real_places[i][:zip],
		theme: Faker::Restaurant.type,
		description: Faker::Restaurant.description,
		lat: real_places[i][:lat],
		long: real_places[i][:long]
	)
end

# Cleanup Existing Menu Data
Menu.delete_all

# 5 menus with business_id 1-5
(1..10).each { |i| Menu.create!(business_id: i, name: Faker::Company.bs) }

# Cleanup Existing Customer Data
Customer.delete_all

# 5 customers with user_ids 6-10
(11..15).each do |i|
	Customer.create!(user_id: i, custname: Faker::DcComics.name)
end

# Cleanup Existing Item Data
Item.delete_all

(1..10).each do |i|
	# add more calls to create for additional menu items
	# number of .create calls == number of items per menu
	Item.create!(
		menu_id: i,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
end

# Cleanup Existing Review Data
Review.delete_all

# have each customer leave 1 review on each business, add more reviews as needed with extra .create calls

(1..10).each do |i|
	Review.create!(
		customer_id: 1,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 2,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 3,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 4,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 5,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
end

