FactoryBot.define do
	factory :business, class: Business do
		# association :user, factory: :random_user
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
		user
	end
end
