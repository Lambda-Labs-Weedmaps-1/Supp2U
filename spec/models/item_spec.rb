require 'rails_helper'

RSpec.describe Item, type: :model do
	describe 'associations' do
		it { should belong_to(:menu).class_name('Menu') }
	end

	describe 'validations' do
		it { should validate_presence_of(:item_name) }
		it { should validate_presence_of(:price) }
	end

	describe 'validate image' do
		it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
	end
end
