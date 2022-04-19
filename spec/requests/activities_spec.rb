# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:activity) do
    create(:activity)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  context '001 - GET /api/activities' do
    before do
      params = {
        user_id: activity.user.id
      }
      get '/api/activities', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivities')
      expect(response_body['activities'].present?).to be true
    end
  end

  context '002 - GET /api/activities/:id' do
    before do
      get "/api/activities/#{activity.id}", headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivityById')
      expect(response_body['activity'].present?).to be true
    end
  end
end
