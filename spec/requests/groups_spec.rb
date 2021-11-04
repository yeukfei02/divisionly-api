require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before(:all) do
    @group = create(:group)
  end

  describe 'POST /api/groups' do
    before do
      params = {
        name: @group.name,
        description: @group.description,
        type: @group.type,
        user_id: @group.user_id
      }
      post '/api/groups', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createGroup')
    end
  end

  describe 'GET /api/groups' do
    before do
      get '/api/groups'
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getGroups')
      expect(response_body['groups'].present?).to be true
    end
  end

  describe 'GET /api/groups/:id' do
    before do
      get "/api/groups/#{@group.id}"
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getGroupById')
      expect(response_body['group'].present?).to be true
    end
  end
end
