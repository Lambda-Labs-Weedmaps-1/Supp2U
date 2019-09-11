FactoryBot.define do
	factory :item do
		menu_id { Faker::Number.within(range: 1..1_000) }
		item_name { Faker::Food.dish }
		price { Faker::Number.decimal(l_digits: 2) }
	end

	# factory :random_item, class: Item do
	# 	menu_id { Faker::Number.within(range: 1..1_000) }
	# 	item_name { Faker::Food.dish }
	# 	price { Faker::Number.decimal(l_digits: 2) }
	# end
end
