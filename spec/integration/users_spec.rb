require 'swagger_helper'

describe 'Users' do
    path '/users'do
      let(:users) { User.create([{ email: 'foo@go.com' }, { email: 'foo2@go.com' }, { email: 'foo3@go.com' } ])}
      get 'users' do
        tags 'User'
        consumes 'application/json'
        response '200', 'All users' do
          schema '$ref' => '#/definitions/Users'
          run_test!
        end
      end
      post 'Creates a user' do
        tags 'User'
        consumes 'application/json'
        parameter name: :users, in: :body, schema: { '$ref' => '#/definitions/User', required: %w[email] }

        response '201', 'User created' do
          # schema type: :object, '$ref' => '#/definitions/User'
          let(:user) { { email: "sibht@yahsadas.com" } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:user) { { name: nil } }
          run_test!
        end
      end
    end
end




# require 'swagger_helper'
#
# describe 'User API', type: :request do
#
#   path '/users' do
#
#     get(summary: 'Gets all users') do
#       tags 'User'
#       consumes 'application/json'
#
#       let(:user) { User.create([{ email: 'foo@ya.com', password: 'bar' }, { email: 'foo2@ya.com', password: 'bar2' }]) }
#
#       response '200', 'All users' do
#         schema '$ref' => '#/definitions/Users'
#         it 'Return 3 contacts' do
#           body = JSON(response.body)
#           expect(body.count).to eq(3)
#         end
#         # run_test!
#       end
#     end
#     post 'Creates a customer' do
#       tags 'User'
#       consumes 'application/json', 'application/xml'
#       parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }
#
#       response '201', 'User created' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#
#       response '422', 'invalid request' do
#         let(:user) { { name: nil } }
#         run_test!
#       end
#     end
#   end
#   path '/users/{id}' do
#     get 'Get a user by id ' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       response '200', 'User by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#         end
#     end
#     put 'Updated user by id' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }
#
#       response '200', 'Updated user by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#     end
#     delete 'Delete user by id' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#
#       response '200', 'Delete user by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#     end
#   end
# end
#
# #
# # describe 'Users', type: :request, capture_examples: true do
# #
# #   path '/users' do
# #
# #     get(summary: 'Gets all users') do
# #       tags 'User'
# #       consumes 'application/json'
# #       let(:users) { User.create([{ email: 'foo@ya.com', password: 'bar' }, { email: 'foo2@ya.com', password: 'bar2' }]) }
# #
# #       # let!(:users) do
# #       #   3.times do
# #       #     create(:users)
# #       #   end
# #       # end
# #       response '200', 'All users' do
# #         schema type: :array, '$ref' => '#/definitions/Users'
# #         it 'Return 3 contacts' do
# #           body = JSON(response.body)
# #           expect(body.count).to eq(3)
# #         end
# #         # run_test!
# #       end
# #     end

# require 'swagger_helper'
#
# describe 'User API' do
#   path '/users' do
#     get 'Gets all users' do
#       tags 'User'
#       consumes 'application/json'
#       response '200', 'All users' do
#         schema type: :array, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#     end
#     post 'Creates a customer' do
#       tags 'User'
#       consumes 'application/json', 'application/xml'
#       parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }
#
#       response '201', 'User created' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#
#       response '422', 'invalid request' do
#         let(:user) { { name: nil } }
#         run_test!
#       end
#     end
#   end
#   path '/users/{id}' do
#     get 'Get a user by id ' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       response '200', 'User by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#         end
#     end
#     put 'Updated user by id' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#       parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }
#
#       response '200', 'Updated user by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#     end
#     delete 'Delete user by id' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :id, :in => :path, :type => :integer
#
#       response '200', 'Delete user by id' do
#         schema type: :object, '$ref' => '#/definitions/Users'
#         run_test!
#       end
#     end
#   end
# end