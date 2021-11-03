require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = create(:user)
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
end
