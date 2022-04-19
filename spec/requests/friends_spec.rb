# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:friend) do
    create(:friend)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  context 'POST /api/friends' do
    before do
      params = {
        name: friend.name,
        description: friend.description,
        phone_number: friend.phone_number.to_s,
        user_id: friend.user_id
      }
      post '/api/friends', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createFriend')
    end
  end

  context 'GET /api/friends' do
    before do
      params = {
        user_id: friend.user.id
      }
      get '/api/friends', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getFriends')
      expect(response_body['friends'].present?).to be true
    end
  end

  context 'GET /api/friends/:id' do
    before do
      get "/api/friends/#{friend.id}", headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getFriendById')
      expect(response_body['friend'].present?).to be true
    end
  end

  context 'PUT /api/friends/:id' do
    before do
      params = {
        name: "#{friend.name}-test",
        description: "#{friend.description}-test",
        phone_number: '99998888',
        user_id: friend.user.id
      }
      put "/api/friends/#{friend.id}", params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('updateFriendById')
    end
  end

  context 'POST /api/friends/remove' do
    before do
      params = {
        id: friend.id,
        user_id: friend.user_id
      }
      post '/api/friends/remove', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('deleteFriendById')
    end
  end
end
