FactoryBot.define do
	factory :menu do
		business
		name { Faker::Restaurant.name }

		factory :menu_with_items do
			transient { items_count { 45 } }
			after(:create) do |menu, evaluator|
				create_list(:item, evaluator.items_count, menu: menu)
			end
		end
	end
end
