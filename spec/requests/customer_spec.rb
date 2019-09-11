require 'rails_helper'

RSpec.describe 'Customer request', type: :request do
  describe 'GET /api/v1/customers' do
    before do
      create(:random_user)
      create_list(:random_customer, 3)
    end
    it 'should return all[3] customers' do
      get '/api/v1/customers'
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response_body.count).to eq(3)
    end
  end
  describe 'POST /api/v1/users/{id}/customers' do
    let(:user) { create(:random_user) }
    context 'with valid request' do
      it 'should return 201 status ' do
        customer = { user_id: user[:id] }

        post "/api/v1/users/#{user[:id]}/customers", params: customer
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
        expect(response_body[:custname]).to eq(customer[:custname])

      end
    end
    context 'with invalid request' do
      it 'should return 422 status ' do
        customer = { user_id: nil }
        post "/api/v1/users/100/customers", params: customer
        expect(response).to have_http_status(422)
      end
    end
  end
  describe 'GET /api/v1/customers/{id}' do
    let(:user) { create(:random_user) }
    let(:customer) { create(:random_customer) }

    it 'should return customer by id' do
      puts customer[:id]
      get "/api/v1/customers/#{customer[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:custname]).to eq(customer[:custname])
      expect(response_body[:user_id]).to eq(customer[:user_id])
    end
  end
  describe 'PUT /api/v1/customers/{id}' do
    let(:user) { create(:random_user) }
    let(:customer) { create(:random_customer) }

    it 'should update customers by id' do
      update_customer = { custname: 'portland' }
      put "/api/v1/customers/#{customer[:id]}", params: update_customer

      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:custname]).to eq(update_customer[:custname])
      expect(response_body[:id]).to eq(customer[:id])
    end
    it 'should send invalid request to update customers by id' do
      update_customer = { user_id: nil }
      put "/api/v1/customers/#{customer[:id]}", params: update_customer
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(422)
      expect(response_body[:user]).to eq(['must exist'])

    end
  end
  describe 'DELETE /api/v1/customers/{id}' do
    let(:user) { create(:random_user) }
    let(:customer) { create(:random_customer) }

    it 'should delete customers by id' do
      delete "/api/v1/customers/#{customer[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:message]).to eq('Your customer has successfully been terminated.')
    end
    # it 'should send invalid user id' do
    #   delete "/api/v1/users/#{user[:id]}"
    #   response_body = JSON.parse(response.body).deep_symbolize_keys
    #   puts response_body
    #   expect(response).to have_http_status(200)
    #   expect(response_body[:message]).to eq('Could not find the user you are trying to remove.')
    # end
  end

  describe 'GET /api/v1/users/{user_id}/customers' do
    let(:user) { create(:random_user) }
    let(:random_customer) { create(:random_customer, user_id: user[:id]) }


    it 'should return business by user_id' do
      puts user[:id]
      puts random_customer

      get "/api/v1/users/#{user[:id]}/customers"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:custname]).to eq(random_customer[:custname])
    end
  end
end
