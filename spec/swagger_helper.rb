require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:to_swagger' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'Yelp clone api'
      },
      servers: [{ url: 'https://development.gigantic-server.com/v1', description: 'Development server' },
                  { url: 'https://staging.gigantic-server.com/v1', description: 'Staging server' },
                  { url: 'https://api.gigantic-server.com/v1', description: 'Production server' }],
      basePath: '/api/v1',
      paths: {},
      definitions: {
        Users: {
          type: 'object',
          properties: {
            name: { type: 'string' },
            username: { type: 'string' },
            email: { type: 'string' },
            password: { type: 'string' },
            wallet: { type: 'string' },
            is_admin: { type: 'boolean' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          },
          required: %w[username email password]
        },
        Customers: {
          type: 'object',
          properties: {
            user_id: { type: 'integer' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          }
        },
        Businesses: {
          type: 'object',
          properties: {
            user_id: { type: 'integer' },
            name: { type: 'string' },
            website: { type: 'string' },
            city: { type: 'string' },
            street: { type: 'string' },
            state: { type: 'string' },
            zipcode: { type: 'string' },
            building_number: { type: 'string' },
            theme: { type: 'string' },
            description: { type: 'string' },
            hours: { type: 'string' },
            long: { type: 'string' },
            lat: { type: 'string' },
            recommended: { type: 'boolean' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          }
        },
        Menus: {
          type: 'object',
          properties: {
            business_id: { type: 'integer' },
            name: { type: 'string' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          }
        },
        Reviews: {
          type: 'object',
          properties: {
            customer_id: { type: 'integer' },
            business_id: { type: 'integer' },
            review: { type: 'string' },
            rating: { type: 'number' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          }
        },
        Items: {
          type: 'object',
          properties: {
            menu_id: { type: 'integer' },
            item_name: { type: 'string' },
            price: { type: 'number' },
            category: { type: 'string' },
            created_at: { type: 'string' },
            updated_at: { type: 'string' }
          }
        }
      },
      securityDefinitions: {
        BasicAuth: {
          type: :basic
        },
        ApiKey: {
          type: :apiKey,
          name: 'api_key',
          in: :header
        }
      }
    }
  }
end
