require 'swagger_helper'

describe 'User API' do
  path '/users' do
    get 'Gets all users' do
      tags 'User'
      consumes 'application/json'
      response '200', 'All users' do
        schema type: :array, '$ref' => '#/definitions/Users'
        run_test!
      end
    end
    post 'Creates a customer' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }

      response '201', 'User created' do
        schema type: :object, '$ref' => '#/definitions/Users'
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: nil } }
        run_test!
      end
    end
  end
  path '/users/{id}' do
    get 'Get a user by id ' do
      tags 'User'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      response '200', 'User by id' do
        schema type: :object, '$ref' => '#/definitions/Users'
        run_test!
        end
    end
    put 'Updated user by id' do
      tags 'User'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :user, in: :body, schema: { '$ref' => '#/definitions/Users', required: %w[username email password] }

      response '200', 'Updated user by id' do
        schema type: :object, '$ref' => '#/definitions/Users'
        run_test!
      end
    end
    delete 'Delete user by id' do
      tags 'User'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Delete user by id' do
        schema type: :object, '$ref' => '#/definitions/Users'
        run_test!
      end
    end
  end
end