require 'rails_helper'

RSpec.describe 'QrCodes', type: :request do
  before(:all) do
    @user = create(:user)

    token = UsersHelper.get_jwt_token(@user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - GET /api/qr-code/generate-qr-code' do
    before do
      params = {
        user_id: @user.id
      }
      get '/api/qr-code/generate-qr-code', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('generateQRCode')
      expect(response_body['qr_code_str'].present?).to be true
    end
  end
end
