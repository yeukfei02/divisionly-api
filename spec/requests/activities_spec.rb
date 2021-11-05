require 'rails_helper'

RSpec.describe 'Activities', type: :request do
  before(:all) do
    @activity = create(:activity)

    token = UsersHelper.get_jwt_token(@activity.user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - POST /api/activities' do
    before do
      params = {
        title: @activity.title,
        description: @activity.description,
        user_id: @activity.user_id
      }
      post '/api/activities', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createActivity')
    end
  end

  describe '002 - GET /api/activities' do
    before do
      params = {
        user_id: @activity.user.id
      }
      get '/api/activities', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivities')
      expect(response_body['activities'].present?).to be true
    end
  end

  describe '003 - GET /api/activities/:id' do
    before do
      get "/api/activities/#{@activity.id}", headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getActivityById')
      expect(response_body['activity'].present?).to be true
    end
  end

  describe '004 - PUT /api/activities/:id' do
    before do
      params = {
        title: "#{@activity.title}-test",
        description: "#{@activity.description}-test"
      }
      put "/api/activities/#{@activity.id}", params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('updateActivityById')
    end
  end

  describe '005 - DELETE /api/activities/:id' do
    before do
      delete "/api/activities/#{@activity.id}", headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('deleteActivityById')
    end
  end
end
