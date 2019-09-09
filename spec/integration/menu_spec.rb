# require 'swagger_helper'

# describe 'Menus API' do
#   path '/menus/{id}' do
#     get 'Get a menu by id ' do
#       tags 'Menu'
#       consumes 'application/json'
#       parameter name: :id, in: :path, type: :integer
#       response '200', 'Menu by id' do
#         schema type: :object, '$ref' => '#/definitions/Menus'
#         run_test!
#       end
#     end
#     put 'Updated menu by id' do
#       tags 'Menu'
#       consumes 'application/json'
#       parameter name: :id, in: :path, type: :integer
#       parameter name: :menu, in: :body, schema: { '$ref' => '#/definitions/Menus' }

#       response '200', 'Updated menu by id' do
#         schema type: :object, '$ref' => '#/definitions/Menus'
#         run_test!
#       end
#     end
#     delete 'Delete menu by id' do
#       tags 'Menu'
#       consumes 'application/json'
#       parameter name: :id, in: :path, type: :integer

#       response '200', 'Delete menu by id' do
#         schema type: :object, '$ref' => '#/definitions/Menus'
#         run_test!
#       end
#     end
#   end
#   path '/businesses/{id}/menus' do
#     post 'Creates a menu' do
#       tags 'Menu'
#       consumes 'application/json'
#       parameter name: :menu, in: :body, schema: { '$ref' => '#/definitions/Menus' }
#       parameter name: :id, in: :path, type: :integer

#       response '201', 'Menu created' do
#         schema type: :object, '$ref' => '#/definitions/Menus'
#         run_test!
#       end

#       response '422', 'invalid requests' do
#         let(:user) { { name: nil } }
#         run_test!
#       end
#     end
#   end
# end