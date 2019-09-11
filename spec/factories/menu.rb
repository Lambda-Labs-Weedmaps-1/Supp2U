FactoryBot.define do
	factory :menu do
		business_id { 1 }
		name { Faker::Restaurant.name }
	end

	# factory :random_menu, class: Menu do
	#   business_id { 1 }
	#   name { Faker::Restaurant.name }
	#   # business_id { Faker::Number.within(range: 1..10)}
	# end
end
