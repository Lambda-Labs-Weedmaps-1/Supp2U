FactoryBot.define do
	factory :review do
		customer
		business
		review { 'It was decent' }
		rating { 2 }
		image do
			{
				io: File.open(Rails.root.join('spec/assets/test.png')),
				filename: 'test.png',
				content_type: 'image/png'
			}
		end
	end
end
