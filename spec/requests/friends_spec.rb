require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  before(:all) do
    @friend = create(:friend)
  end

  describe 'POST /api/friends' do
    before do
      params = {
        title: @friend.title,
        description: @friend.description,
        phone_number: @friend.phone_number,
        user_id: @friend.user_id
      }
      post '/api/friends', params: params
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
      get '/api/friends'
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
      get "/api/friends/#{@friend.id}"
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getFriendById')
      expect(response_body['friend'].present?).to be true
    end
  end
end
