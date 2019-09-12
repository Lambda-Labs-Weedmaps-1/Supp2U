require 'rails_helper'

RSpec.describe User, type: :model do
	# Validate -> Associations -> Indexes -> Destruction!!!
	# FactoryBot building a 'valid user'
	# by using `subject` test will reference the object
	# subject { build(:user) }

	# build(:user) => Returns instance w/o saving
	# create(:user) => Returns saved instance
	# before { built_users = build_list(:random_user, 10) }

	describe 'associations' do
		it { should have_one(:customer).class_name('Customer') }
		it { should have_one(:business).class_name('Business') }
	end

	describe 'validations' do
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }
	end
end
