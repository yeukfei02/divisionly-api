require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  before(:all) do
    @friend = create(:friend)

    token = UsersHelper.get_jwt_token(@friend.user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe 'POST /api/friends' do
    before do
      params = {
        name: @friend.name,
        description: @friend.description,
        phone_number: @friend.phone_number,
        user_id: @friend.user_id
      }
      post '/api/friends', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createFriend')
    end
  end

  describe 'GET /api/friends' do
    before do
      params = {
        user_id: @friend.user.id
      }
      get '/api/friends', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getFriends')
      expect(response_body['friends'].present?).to be true
    end
  end

  describe 'GET /api/friends/:id' do
    before do
      get "/api/friends/#{@friend.id}", headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getFriendById')
      expect(response_body['friend'].present?).to be true
    end
  end

  describe 'PUT /api/friends/:id' do
    before do
      params = {
        name: "#{@friend.name}-test",
        description: "#{@friend.description}-test",
        phone_number: 99_998_888
      }
      put "/api/friends/#{@friend.id}", params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('updateFriendById')
    end
  end

  describe 'DELETE /api/friends/:id' do
    before do
      delete "/api/friends/#{@friend.id}", headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('deleteFriendById')
    end
  end
end
