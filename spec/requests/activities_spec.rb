require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  before(:all) do
    @activity = create(:activity)
  end

  describe 'POST /api/activities' do
    before do
      params = {
        title: @activity.title,
        description: @activity.description,
        user_id: @activity.user_id
      }
      post '/api/activities', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createActivity')
    end
  end

  describe 'GET /api/activities' do
    before do
      get '/api/activities'
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivities')
      expect(response_body['activities'].present?).to be true
    end
  end

  describe 'GET /api/activities/:id' do
    before do
      get "/api/activities/#{@activity.id}"
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivityById')
      expect(response_body['activity'].present?).to be true
    end
  end
end
