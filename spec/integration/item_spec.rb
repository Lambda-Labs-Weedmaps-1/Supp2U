# require 'swagger_helper'

# describe 'Menus API' do
#   path '/items/{id}' do
#     get 'Get a item by id ' do
#       tags 'Item'
#       consumes 'application/json'
#       security  [ApiKey: []]
#       parameter name: :id, in: :path, type: :integer
#       response '200', 'Item by id' do
#         schema type: :object, '$ref' => '#/definitions/Items'
#         run_test!
#       end
#     end
#     put 'Updated item by id' do
#       tags 'Item'
#       consumes 'application/json'
#       parameter name: :id, in: :path, type: :integer
#       parameter name: :item, in: :body, schema: { '$ref' => '#/definitions/Items' }

#       response '200', 'Updated item by id' do
#         schema type: :object, '$ref' => '#/definitions/Items'
#         run_test!
#       end
#     end
#     delete 'Delete item by id' do
#       tags 'Item'
#       consumes 'application/json'
#       parameter name: :id, in: :path, type: :integer

#       response '200', 'Delete item by id' do
#         schema type: :object, '$ref' => '#/definitions/Items'
#         run_test!
#       end
#     end
#   end
#   path '/menus/{id}/items' do
#     post 'Creates an item' do
#       tags 'Item'
#       consumes 'application/json'
#       parameter name: :item, in: :body, schema: { '$ref' => '#/definitions/Items' }
#       parameter name: :id, in: :path, type: :integer

#       response '201', 'Item created' do
#         schema type: :object, '$ref' => '#/definitions/Items'
#         run_test!
#       end

#       response '422', 'invalid requests' do
#         let(:user) { { name: nil } }
#         run_test!
#       end
#     end
#   end
# end