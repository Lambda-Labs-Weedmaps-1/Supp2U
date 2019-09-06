require 'rails_helper'

RSpec.describe Schedule, type: :model do
	describe 'associations' do
		it { should belong_to(:business).class_name('Business') }
	end
end
