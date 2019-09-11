require 'rails_helper'
# api_v1_item
# GET    /api/v1/items/:id(.:format)               api/v1/items#show
# PUT    /api/v1/items/:id(.:format)               api/v1/items#update
# DELETE /api/v1/items/:id(.:format)               api/v1/items#destroy

RSpec.describe 'Items API', type: :request do
	# describe 'GET /api/v1/items/:id' do
	# 	let(:item) { create(:item) }
	# 	let(:serializer) { described_class.new(item) }
	# 	let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
	# 	let(:subject) { serialize }

	# 	it 'retrieves a specific item' do
	# 		get "/api/v1/items/#{item[:id]}"
	# 		response_body = json.deep_symbolize_keys

	# 		expect(response).to have_http_status(200)
	# 		expect(json).to serialize_object(item).with(ItemSerializer)
	# 		# expect(subject[:item_name]).to eq(item.item_name)
	# 	end
	# end
end
