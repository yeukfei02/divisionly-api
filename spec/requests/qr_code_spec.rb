# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'QrCodes', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  context '001 - GET /api/qr-code/generate-qr-code' do
    before do
      params = {
        user_id: user.id
      }
      get '/api/qr-code/generate-qr-code', params: params, headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('generateQRCode')
      expect(response_body['qr_code_str'].present?).to be true
    end
  end
end
