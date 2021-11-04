require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = create(:user)

    token = UsersHelper.get_jwt_token(@user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe 'POST /api/users/signup' do
    before do
      params = {
        email: @user.email,
        password: @user.password
      }
      post '/api/users/signup', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('signup')
    end
  end

  describe 'POST /api/users/login' do
    before do
      params = {
        email: @user.email,
        password: 'test'
      }
      post '/api/users/login', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('login')
      expect(response_body['token'].present?).to be true
      expect(response_body['user_id']).to eq(@user.id)
    end
  end

  describe 'GET /api/users' do
    before do
      get '/api/users'
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getUsers')
      expect(response_body['users'].present?).to be true
    end
  end

  describe 'GET /api/users/:id' do
    before do
      get "/api/users/#{@user.id}"
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getUserById')
      expect(response_body['user'].present?).to be true
    end
  end

  describe 'POST /api/users/:id/change-password' do
    before do
      params = {
        old_password: 'test',
        new_password: 'test1'
      }
      post "/api/users/#{@user.id}/change-password", params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('changePassword')
    end
  end
end
