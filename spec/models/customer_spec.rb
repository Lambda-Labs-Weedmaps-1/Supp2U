require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
		it { should have_many(:reviews).class_name('Review') }
		it { should have_one(:cart).class_name('Cart') }
	end

	context 'attributes' do
		it 'has expected attributes' do
			typical_customer = create(:customer)
			expect(typical_customer.attribute_names).to include('user_id', 'custname')
		end
		it 'has expected amount of reviews' do
			review_count = create(:customer_with_reviews).reviews.length
			expect(review_count).to eq(11)
		end
	end
end
