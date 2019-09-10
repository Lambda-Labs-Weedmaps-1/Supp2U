FactoryBot.define do
	factory :business do
		user_id { 1 }
		name { "Angelo's Taverna" }
		city { 'Denver' }
		state { 'CO' }
		street { '620 E 6th Ave' }
		zipcode { 80_203 }
		# add image url
		image {}
	end

	factory :random_business, class: Business do
		user_id { 1 }
		# user_id { Faker::Number.within(range: 1..10) }
		name { Faker::Restaurant.name }
		city { Faker::Address.city }
		state { Faker::Address.state }
		street { Faker::Address.street_address }
		zipcode { Faker::Address.zip }
		# add image url
		image {}
	end
end
