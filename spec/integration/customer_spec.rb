# require 'swagger_helper'

# describe 'Customer API' do
#   path '/customers' do

#     get 'Gets all customers' do
#       tags 'Customer'
#       consumes 'application/json', 'application/xml'
#       response '200', 'All users' do
#         schema type: :array, '$ref' => '#/definitions/Customers'
#         run_test!
#       end
#     end
#   end
#   path '/customers/{id}' do
#     get 'Get a customer by id ' do
#       tags 'Customer'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       response '200', 'Customer by id' do
#         schema type: :object, '$ref' => '#/definitions/Customers'
#         run_test!
#       end
#     end
#     put 'Updated customer by id' do
#       tags 'Customer'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Customers', required: %w[username email password] }

#       response '200', 'Updated customer by id' do
#         schema type: :object, '$ref' => '#/definitions/Customer'
#         run_test!
#       end
#     end
#     delete 'Delete customer by id' do
#       tags 'Customer'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer

#       response '200', 'Delete customer by id' do
#         schema type: :object, '$ref' => '#/definitions/Customers'
#         run_test!
#       end
#     end
#   end
#   path '/users/{id}/customers' do
#     post 'Creates a customer' do
#       tags 'Customer'
#       consumes 'application/json'
#       parameter name: :customer, in: :body, schema: { '$ref' => '#/definitions/Customers' }
#       parameter name: :id, :in => :path, :type => :integer

#       response '201', 'Customer created' do
#         schema type: :object, '$ref' => '#/definitions/Customers'
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:user) { { name: nil } }
#         run_test!
#       end
#     end
#   end
# end