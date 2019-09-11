FactoryBot.define do
	factory :customer, class: Customer do
		# association :user, factory: :random_user
		custname { Faker::Name.name }
		# add image url
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
