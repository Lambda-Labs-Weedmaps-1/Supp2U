FactoryBot.define do
	factory :customer, class: Customer do
		user
		custname { Faker::Name.name }
		image do
			{
				io: File.open(Rails.root.join('spec/assets/test.png')),
				filename: 'test.png',
				content_type: 'image/png'
			}
		end

		factory :customer_with_reviews do
			transient { reviews_count { 7 } }
			after(:create) do |customer, evaluator|
				create_list(:review, evaluator.reviews_count, customer: customer)
			end
		end
	end
end
