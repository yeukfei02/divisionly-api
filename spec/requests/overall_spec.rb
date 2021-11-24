require 'rails_helper'

RSpec.describe 'Overalls', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:expense) do
    create(:expense, user: user)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - GET /api/overall/get-total-owe-amount' do
    before do
      params = {
        user_id: expense.user.id
      }
      get '/api/overall/get-total-owe-amount', params: params, headers: headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getTotalOweAmount')
      expect(response_body['total_owe_amount_list'].present?).to be true
      expect(response_body['total_owe_amount'] > 0).to be true
    end
  end
end
