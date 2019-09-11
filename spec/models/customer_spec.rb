require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe 'associations' do
		it { should belong_to(:user).class_name('User') }
		it { should have_many(:reviews).class_name('Review') }
	end
end
