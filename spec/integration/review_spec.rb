require 'swagger_helper'

describe 'Reviews API' do
  path '/reviews/{id}' do
    get 'Get a review by id ' do
      tags 'Review'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      response '200', 'Review by id' do
        schema type: :object, '$ref' => '#/definitions/Reviews'
        run_test!
      end
    end
    put 'Updated review by id' do
      tags 'Review'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :review, in: :body, schema: { '$ref' => '#/definitions/Reviews' }

      response '200', 'Updated review by id' do
        schema type: :object, '$ref' => '#/definitions/Reviews'
        run_test!
      end
    end
    delete 'Delete review by id' do
      tags 'Review'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Delete review by id' do
        schema type: :object, '$ref' => '#/definitions/Revies'
        run_test!
      end
    end
  end
  path '/customers/{id}/reviews' do
    get 'Get a review by id ' do
      tags 'Review'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer
      response '200', 'Review by id' do
        schema type: :object, '$ref' => '#/definitions/Reviews'
        run_test!
      end
    end
    post 'Creates a menu' do
      tags 'Review'
      consumes 'application/json'
      parameter name: :reveiw, in: :body, schema: { '$ref' => '#/definitions/Reviews' }
      parameter name: :id, in: :path, type: :integer

      response '201', 'Review created' do
        schema type: :object, '$ref' => '#/definitions/Reviews'
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: nil } }
        run_test!
      end
    end
  end
end