# require 'swagger_helper'
# RSpec.describe "Business Controller", type: :request do
#   describe 'Customer API' do
#     let(:users) { User.create([{ email: 'foo@go.com' }, { email: 'foo2@go.com' }, { email: 'foo3@go.com' }]) }
#
#     path '/businesses' do
#       get 'Gets all businesses' do
#         tags 'Business'
#         consumes 'application/json'
#         response '200', 'All businesses' do
#           schema '$ref' => '#/definitions/Businesses'
#           before(:all) do
#             create(:user)
#             create_list(:random_business, 3)
#           end
#
#           run_test! do |response|
#             data = JSON.parse(response.body)
#             expect(data.length).to eq(3)
#           end
#         end
#       end
#     end
#     path '/businesses/{id}' do
#       get 'Get a business by id ' do
#         tags 'Business'
#         consumes 'application/json'
#         parameter name: :id, :in => :path, :type => :integer
#
#         response '200', 'Business by id' do
#           schema type: :object, '$ref' => '#/definitions/Businesses'
#           let(:business) { create(:random_business) }
#           let(:id) { business[:id] }
#
#           run_test! do |response|
#             data = JSON.parse(response.body)
#             expect(data['id']).to eq(id)
#             expect(data['state']).to eq(business[:state])
#             expect(data['city']).to eq(business[:city])
#           end
#         end
#       end
#       put 'Updated business by id' do
#         tags 'Business'
#         consumes 'application/json'
#         parameter name: :id, :in => :path, :type => :integer
#         parameter name: :updateBusiness, in: :body, schema: { '$ref' => '#/definitions/Businesses'}
#
#         response '200', 'Updated business by id' do
#           schema type: :object, '$ref' => '#/definitions/Businesses'
#           let(:business) { create(:random_business) }
#           let(:id) { business[:id] }
#           let(:updateBusiness) { { city: 'portland' } }
#
#           run_test! do |response|
#             data = JSON.parse(response.body)
#             expect(data['id']).to eq(id)
#             expect(data['state']).to eq(business[:state])
#             expect(data['city']).to eq('portland')
#           end
#         end
#       end
#       delete 'Delete business by id' do
#         tags 'Business'
#         consumes 'application/json'
#         parameter name: :id, :in => :path, :type => :integer
#
#         response '200', 'Delete business by id' do
#           schema type: :object, '$ref' => '#/definitions/Businesses'
#           let(:business) { create(:random_business) }
#           let(:id) { business[:id] }
#           run_test! do |response|
#             data = JSON.parse(response.body)
#             expect(data['id']).to eq(id)
#
#           end
#         end
#       end
#     end
#     # path '/users/{id}/businesses' do
#     #   post 'Creates a business' do
#     #     tags 'Business'
#     #     consumes 'application/json'
#     #     parameter name: :business, in: :body, schema: { '$ref' => '#/definitions/Businesses' }
#     #     parameter name: :id, :in => :path, :type => :integer
#     #
#     #     response '201', 'Business created' do
#     #       schema type: :object, '$ref' => '#/definitions/Businesses'
#     #       run_test!
#     #     end
#     #
#     #     response '422', 'invalid requests' do
#     #       let(:user) { { name: nil } }
#     #       run_test!
#     #     end
#     #   end
#     end
# # end
# end