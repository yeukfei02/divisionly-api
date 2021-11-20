require 'rails_helper'

RSpec.describe 'Overalls', type: :request do
  before(:all) do
    @user = create(:user)

    token = UsersHelper.get_jwt_token(@user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - GET /api/overall/get-total-owe-amount' do
    before do
      params = {
        user_id: @user.id
      }
      get '/api/overall/get-total-owe-amount', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getTotalOweAmount')
      expect(response_body['total_owe_amount'].present?).to be true
    end
  end
end
