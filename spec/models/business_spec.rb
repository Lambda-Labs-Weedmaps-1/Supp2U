require 'rails_helper'

# Run with `rspec spec/models/business_spec.rb`
RSpec.describe Business, type: :model do
	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:street) }
		it { should validate_presence_of(:zipcode) }
	end

	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
		it { should have_many(:reviews) }
		it { should have_one(:menu).class_name('Menu') }
		it { should have_one(:schedule).class_name('Schedule') }
	end

	context 'attributes' do
		it 'has expected attributes' do
			typical_business = create(:business)
			expect(typical_business.attribute_names).to include(
				'name',
				'street',
				'zipcode',
				'city',
				'state'
			)
		end
		it 'has expected amount of reviews' do
			review_count = create(:business_with_reviews).reviews.length
			expect(review_count).to eq(7)
		end
	end
end
