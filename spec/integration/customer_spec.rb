require 'swagger_helper'

describe 'Customer API' do
  let(:users) { User.create([{ email: 'foo@go.com' }, { email: 'foo2@go.com' }, { email: 'foo3@go.com' } ]) }

  path '/customers' do
    get 'Gets all customers' do
      tags 'Customer'
      consumes 'application/json', 'application/xml'
      response '200', 'All users' do
        schema '$ref' => '#/definitions/Customers'
        before {  Customer.create([{ user_id: users[0][:id] }, { user_id: users[1][:id] }, { user_id: users[2][:id] } ]) }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(3)
        end
      end
    end
  end
  path '/customers/{id}' do
    get 'Get a customer by id ' do
      tags 'Customer'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      response '200', 'Customer by id' do
        schema '$ref' => '#/definitions/Customer'

        let(:id) { Customer.create(user_id: users[0][:id]).id }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['user_id']).to eq(users[0][:id])
          expect(data['user_id']).not_to eq(users[1][:id])
        end
      end
    end
    put 'Updated customer by id' do
      tags 'Customer'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :updateCustomer, in: :body, schema: { '$ref' => '#/definitions/Customer' }

      response '200', 'Updated customer by id' do
        schema type: :object, '$ref' => '#/definitions/Customer'
        let(:id) { Customer.create(user_id: users[0][:id]).id }
        let(:updateCustomer) { {custname: "updated name"} }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['custname']).to eq(updateCustomer[:custname])
        end
      end
      response '422', 'Updated customer by id' do
        schema type: :object, '$ref' => '#/definitions/Customer'
        let(:id) { Customer.create(user_id: users[1][:id]).id }
        let(:updateCustomer) { { user_id: nil } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['user']).to eq(['must exist'])
        end
      end
    end
    delete 'Delete customer by id' do
      tags 'Customer'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      response '200', 'Delete customer by id' do
        let(:id) { Customer.create(user_id: users[1][:id]).id }

        run_test!
      end
    end
  end
  path '/users/{id}/customers' do
    post 'Creates a customer' do
      tags 'Customer'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :customer, in: :body, schema: { '$ref' => '#/definitions/Customer' }

      response '201', 'Customer created' do
        schema type: :object, '$ref' => '#/definitions/Customer'
        let(:id) { users[0][:id] }
        let(:customer) { { user_id: users[0][:id] } }
        run_test!
      end

      response '422', 'invalid requests' do
        let(:id) { 100 }
        let(:customer) { { user_id: nil } }
        run_test!
      end
    end
  end
end
