require 'rails_helper'

# Run with `rspec spec/models/business_spec.rb`
RSpec.describe Business, type: :model do
	before(:all) do
		# make these Businesses before `all` tests
		@user1 = create(:random_user)
		built_users = build_list(:random_user, 10)
		@business1 = create(:random_business)
	end

	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
		it { should have_many(:reviews) }
		it { should have_one(:menu).class_name('Menu') }
		it { should have_one(:schedule).class_name('Schedule') }
    # it { should have_one_attached?(:image) }
    # Todo verify how this should work with team
		# it { should have_one(:image) }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:street) }
		it { should validate_presence_of(:zipcode) }
		it { should validate_presence_of(:image) }
	end
end
