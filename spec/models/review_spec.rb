require 'rails_helper'

RSpec.describe Review, type: :model do
	describe 'associations' do
		it { should belong_to(:customer).class_name('Customer') }
		it { should belong_to(:business).class_name('Business') }
	end

	describe 'validations' do
		it { should validate_presence_of(:customer_id) }
		it { should validate_presence_of(:business_id) }
		it { should validate_presence_of(:review) }
		it { should validate_presence_of(:rating) }
	end
end
