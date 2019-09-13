require 'rails_helper'

RSpec.describe Menu, type: :model do
	describe 'associations' do
		it { should belong_to(:business).class_name('Business') }
		it { should have_many(:items) }
	end

	context 'attributes' do
		it 'has expected attributes' do
			typical_menu = create(:menu)
			expect(typical_menu.attribute_names).to include('name', 'business_id')
		end
		# it 'has the expected amount of menu items' do
		# 	item_count = create(:menu_with_items).items.length
		# 	expect(item_count).to eq(7)
		# end
	end
end
