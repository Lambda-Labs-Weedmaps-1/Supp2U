require 'rails_helper'

# Run with `rspec spec/models/business_spec.rb`
RSpec.describe Business, type: :model do
	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
		it { should have_many(:reviews) }
		it { should have_one(:menu).class_name('Menu') }
		it { should have_one(:schedule).class_name('Schedule') }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:street) }
		it { should validate_presence_of(:zipcode) }
	end
end
