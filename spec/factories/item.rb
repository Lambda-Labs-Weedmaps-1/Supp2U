FactoryBot.define do
	factory :item do
		menu
		item_name { Faker::Food.dish }
		price { Faker::Number.decimal(l_digits: 2) }
		inventory { Faker::Number.within(range: 1..1_000) }
		image do
			{
				io: File.open(Rails.root.join('spec/assets/test.png')),
				filename: 'test.png',
				content_type: 'image/png'
			}
		end
	end
end
