require 'rails_helper'

RSpec.describe Customer, type: :model do
	before(:all) do
		# can't have a customer until a user exists
		# @user2 = create(:user)
		# @user2 = create(:user)
		# @customer1 = create(:customer)
		# @customer2 = create(:customer)
	end

	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
    it { should have_many(:reviews).class_name('Review') }
    # Todo update
		# it { should have_one(:image) }
	end

	# Todo add once Model has validations attached
	# describe 'validations' do
	#   it { should  }
	# end

	context 'a customer with multiple reviews' do
	end
end
