require 'rails_helper'

RSpec.describe 'Users request', type: :request do
  describe 'GET /api/v1/users' do
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
        user = { email: 'testing@gmail.com' }
        post '/api/v1/users', params: user
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response).to have_http_status(201)
        expect(response_body[:email]).to eq(user[:email])

      end
      it 'should return correct obj ' do
        user = { email: 'testing2@gmail.com' }
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
  describe 'GET /api/v1/users/{id}' do
    let(:user) { create(:random_user) }
    it 'should return user by id' do
      get "/api/v1/users/#{user[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(200)
      expect(response_body[:username]).to eq(user[:username])
      expect(response_body[:email]).to eq(user[:email])
      expect(response_body[:is_admin]).to eq(false)
      expect(response_body[:password]).to eq(nil)
    end
  end
  describe 'PUT /api/v1/users/{id}' do
    let(:user) { create(:random_user) }
    it 'should update user by id' do
      updateUser = { email: 'updatedEmail@gma.com' }
      put "/api/v1/users/#{user[:id]}", params: updateUser
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(201)
      expect(response_body[:email]).to eq(updateUser[:email])
      expect(response_body[:id]).to eq(user[:id])
      expect(response_body[:username]).to eq(user[:username])
    end
    it 'should send invalid request to update user by id' do
      updateUser = { email: nil }
      put "/api/v1/users/#{user[:id]}", params: updateUser
      response_body = JSON.parse(response.body).deep_symbolize_keys
      expect(response).to have_http_status(422)
      expect(response_body[:email]).to eq(['can\'t be blank'])

    end
  end
  describe 'DELETE /api/v1/users/{id}' do
    let(:user) { create(:random_user) }
    it 'should delete user by id' do
      delete "/api/v1/users/#{user[:id]}"
      response_body = JSON.parse(response.body).deep_symbolize_keys
      puts response_body
      expect(response).to have_http_status(200)
      expect(response_body[:message]).to eq('Your user has successfully been terminated.')
    end
    # it 'should send invalid user id' do
    #   delete "/api/v1/users/#{user[:id]}"
    #   response_body = JSON.parse(response.body).deep_symbolize_keys
    #   puts response_body
    #   expect(response).to have_http_status(200)
    #   expect(response_body[:message]).to eq('Could not find the user you are trying to remove.')
    # end
  end
end