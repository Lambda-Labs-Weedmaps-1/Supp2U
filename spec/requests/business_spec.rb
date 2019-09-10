require 'rails_helper'

RSpec.describe 'Business request', type: :request do
  describe 'GET /api/v1/businesses' do
    before(:all) do
      create(:random_user)
      create_list(:random_business, 3)
    end
    it 'should return all[3] businesses' do
      get '/api/v1/businesses'
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response_body.count).to eq(3)
    end
  end
  describe 'Get /api/v1/businesses/business_id/ratings' do
    let(:user) { create(:random_user) }
    let(:random_business) { create(:random_business) }
    context 'with valid request' do
      it 'should return ratings for business by id' do
        get "/api/v1/businesses/#{random_business[:id]}/ratings"
        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response_body).to eq(0)

      end
    end
  end
  describe 'POST /api/v1/users/{id}/businesses' do
    let(:user) { create(:random_user) }
    context 'with valid request' do
      it 'should return 201 status ' do
        businesses = { user_id: 1,
                       name: Faker::Name.name,
                       street: Faker::Address.street_address,
                       zipcode: Faker::Company.sic_code,
                       city: Faker::Address.city,
                       state: Faker::Address.state }

        post "/api/v1/users/#{user[:id]}/businesses", params: businesses
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
        expect(response_body[:name]).to eq(businesses[:name])

      end
    end
    context 'with invalid request' do
      it 'should return 422 status ' do
        businesses = { email: 'testing@gmail.com' }
        post "/api/v1/users/#{user[:id]}/businesses", params: businesses
        expect(response).to have_http_status(422)
      end
    end
  end
  describe 'GET /api/v1/businesses/{id}' do
    let(:user) { create(:random_user) }
    let(:business) { create(:random_business) }

    it 'should return business by id' do
      get "/api/v1/businesses/#{business[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:state]).to eq(business[:state])
      expect(response_body[:city]).to eq(business[:city])
      expect(response_body[:name]).to eq(business[:name])
    end
  end
  describe 'PUT /api/v1/businesses/{id}' do
    let(:user) { create(:random_user) }
    let(:business) { create(:random_business) }

    it 'should update business by id' do
      update_business = { city: 'portland' }
      put "/api/v1/businesses/#{business[:id]}", params: update_business
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:city]).to eq(update_business[:city])
      expect(response_body[:id]).to eq(business[:id])
    end
    it 'should send invalid request to update business by id' do
      update_business = { city: nil }
      put "/api/v1/businesses/#{business[:id]}", params: update_business
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(422)
      expect(response_body[:city]).to eq(['can\'t be blank'])

    end
  end
  describe 'DELETE /api/v1/businesses/{id}' do
    let(:user) { create(:random_user) }
    let(:business) { create(:random_business) }

    it 'should delete businesses by id' do
      delete "/api/v1/businesses/#{business[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      puts response_body
      expect(response).to have_http_status(200)
      expect(response_body[:message]).to eq('Your business has successfully been terminated.')
    end
    # it 'should send invalid user id' do
    #   delete "/api/v1/users/#{user[:id]}"
    #   response_body = JSON.parse(response.body).deep_symbolize_keys
    #   puts response_body
    #   expect(response).to have_http_status(200)
    #   expect(response_body[:message]).to eq('Could not find the user you are trying to remove.')
    # end
  end

  # describe 'GET /api/v1/users/{user_id}/businesses' do
  #   let(:user) { create(:user) }
  #   let(:random_business) { create(:random_business, user_id: user[:id]) }
  #
  #
  #   it 'should return business by user_id' do
  #     puts user[:id]
  #     puts random_business[:image]
  #
  #     get "/api/v1/users/#{user[:id]}/businesses"
  #     response_body = JSON.parse(response.body)
  #     expect(response).to have_http_status(200)
  #     expect(response_body[:city]).to eq(random_business[:city])
  #   end
  # end
end