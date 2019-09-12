FactoryBot.define do
	factory :cart, class: Cart do
		customer
		business
	end
end
