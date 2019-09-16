# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Todo real addresses street, zip, lat - long in a hash
# Todo add 50-100 business and extract hash to it's own file and require it here
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
		street: '20981 E Smoky Hill Rd',
		zip: 80_015,
		lat: '39.608567',
		long: '-104.742429'
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
	},
	11 => {
		street: '880 W Happy Canyon Rd.',
		zip: 80_108,
		lat: '39.4271042',
		long: '-104.9021999'
	},
	12 => {
		street: '18601 Green Valley Ranch Blvd #101',
		zip: 80_249,
		lat: '39.784645',
		long: '-104.767735'
	},
	13 => {
		street: '103 North Rubey Dr.',
		zip: 80_403,
		lat: '39.765138',
		long: '-105.232381'
	},
	14 => {
		street: '7444 W Chatfield Ave',
		zip: 80_128,
		lat: '39.565504',
		long: '-105.081358'
	},
	15 => {
		street: '8181 E Arapahoe Rd',
		zip: 80_112,
		lat: '39.595713',
		long: '-104.893902'
	},
	16 => {
		street: '203 W Hampden Ave',
		zip: 80_110,
		lat: '39.654998',
		long: '-104.990235'
	},
	17 => {
		street: '2772 S Wadsworth Blvd',
		zip: 80_227,
		lat: '39.666141',
		long: '-105.080677'
	},
	18 => {
		street: '3542 S Fox St', zip: 80_110, lat: '39.652076', long: '-104.994474'
	},
	19 => {
		street: '9625 E Arapahoe Rd Ste F',
		zip: 80_112,
		lat: '39.595028',
		long: '-104.817658'
	},
	20 => {
		street: '8101 E Belleview Ave A-90',
		zip: 80_237,
		lat: '39.625717',
		long: '-104.893844'
	}
}

# Cleanup Existing User Data
User.delete_all

(1..30).each do |i|
	User.create!(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: Faker::Internet.password
	)
end

# Cleanup Existing Business Data
Business.delete_all

# 20 businesses with user_ids 1-20
(1..20).each do |i|
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

# 20 menus with business_id 1-20
(1..20).each { |i| Menu.create!(business_id: i, name: Faker::Company.bs) }

# Cleanup Existing Customer Data
Customer.delete_all

# 10 customers with user_ids 21-30
(21..30).each do |i|
	Customer.create!(user_id: i, custname: Faker::DcComics.name)
end

# Cleanup Existing Item Data
Item.delete_all

(1..20).each do |i|
	# add more calls to create for additional menu items
	# number of .create calls == number of items per menu
	# 8 menu items per menu currently
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
	Item.create!(
		menu_id: i,
		description: Faker::Food.description,
		item_name: Faker::Food.dish,
		price: Faker::Commerce.price,
		inventory: Faker::Number.within(range: 1..10),
		category: Faker::Restaurant.type
	)
end

# Cleanup Existing Review Data
Review.delete_all

# have each customer leave 1 review on each business, add more reviews as needed with extra .create calls

(1..20).each do |i|
	Review.create!(
		customer_id: 21,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 22,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 23,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 24,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 25,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 26,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 27,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 28,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 29,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
	Review.create!(
		customer_id: 30,
		business_id: i,
		review: Faker::Restaurant.review,
		rating: Faker::Number.within(range: 1..5)
	)
end
