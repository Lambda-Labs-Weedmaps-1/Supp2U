require 'rails_helper'

RSpec.describe 'Create Users', type: :request do
  describe "GET /api/v1/users" do
    before(:all) do
      create_list(:random_user, 3)
    end
    it 'should return all[3] users' do
      get '/api/v1/users'
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(response_body.count).to eq(3)
    end
  end
  describe 'POST /api/v1/users' do
    context 'with valid request' do
      it 'should return 201 status ' do
        user = { email: "testing@gmail.com" }
        post '/api/v1/users', params: user
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
        expect(response_body[:email]).to eq(user[:email])

      end
      it 'should return correct obj ' do
        user = { email: "testing2@gmail.com" }
        post '/api/v1/users', params: user
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
        expect(response_body[:email]).to eq(user[:email])
      end
    end
    context 'with invalid request' do
      it 'should return 422 status ' do
        user = { email: nil }
        post '/api/v1/users', params: user
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(422)
        expect(response_body[:email]).to eq(["can't be blank"])
      end
    end
  end
end