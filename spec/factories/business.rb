FactoryBot.define do
	factory :business, class: Business do
		user
		name { Faker::Name.name }
		street { Faker::Address.street_address }
		zipcode { Faker::Company.sic_code }
		city { Faker::Address.city }
		state { Faker::Address.state }
		image do
			{
				io: File.open(Rails.root.join('spec/assets/test.png')),
				filename: 'test.png',
				content_type: 'image/png'
			}
		end

		# create(:business).reviews.length # 0
		# create(:business_with_reviews).reviews.length # 7
		# create(:business_with_reviews, reviews_count: 15).reviews.length # 15
		factory :business_with_reviews do
			transient { reviews_count { 7 } }
			after(:create) do |business, evaluator|
				create_list(:review, evaluator.reviews_count, business: business)
			end
		end
	end
end
