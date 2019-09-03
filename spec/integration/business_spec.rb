require 'swagger_helper'

describe 'Customer API' do
  path '/businesses' do
    get 'Gets all businesses' do
      tags 'Business'
      consumes 'application/json'
      response '200', 'All businesses' do
        schema type: :array, '$ref' => '#/definitions/Businesses'
        run_test!
      end
    end
  end
  path '/businesses/{id}' do
    get 'Get a business by id ' do
      tags 'Business'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      response '200', 'Business by id' do
        schema type: :object, '$ref' => '#/definitions/Businesses'
        run_test!
      end
    end
    put 'Updated business by id' do
      tags 'Business'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :business, in: :body, schema: { '$ref' => '#/definitions/Businesses'}

      response '200', 'Updated business by id' do
        schema type: :object, '$ref' => '#/definitions/Businesses'
        run_test!
      end
    end
    delete 'Delete business by id' do
      tags 'Business'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Delete business by id' do
        schema type: :object, '$ref' => '#/definitions/Businesses'
        run_test!
      end
    end
  end
  path '/users/{id}/businesses' do
    post 'Creates a business' do
      tags 'Business'
      consumes 'application/json'
      parameter name: :business, in: :body, schema: { '$ref' => '#/definitions/Businesses' }
      parameter name: :id, :in => :path, :type => :integer

      response '201', 'Business created' do
        schema type: :object, '$ref' => '#/definitions/Businesses'
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: nil } }
        run_test!
      end
    end
  end
end