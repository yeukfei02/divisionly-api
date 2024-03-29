# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:group) do
    create(:group)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  context '001 - POST /api/groups' do
    before do
      params = {
        name: group.name,
        description: group.description,
        group_type: group.group_type,
        user_id: group.user_id
      }
      post '/api/groups', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createGroup')
    end
  end

  context '002 - GET /api/groups' do
    before do
      params = {
        user_id: group.user.id
      }
      get '/api/groups', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getGroups')
      expect(response_body['groups'].present?).to be true
    end
  end

  context '003 - GET /api/groups/:id' do
    before do
      get "/api/groups/#{group.id}", headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getGroupById')
      expect(response_body['group'].present?).to be true
    end
  end

  context '004 - PUT /api/groups/:id' do
    before do
      params = {
        name: "#{group.name}-test",
        description: "#{group.description}-test",
        group_type: Group.types['other'],
        user_id: group.user.id
      }
      put "/api/groups/#{group.id}", params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('updateGroupById')
    end
  end

  context '005 - POST /api/groups/remove' do
    before do
      params = {
        id: group.id,
        user_id: group.user_id
      }
      post '/api/groups/remove', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('deleteGroupById')
    end
  end
end
