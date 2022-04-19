# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ExpenseCategories', type: :request do
  let!(:user) do
    create(:user)
  end
  let!(:headers) do
    token = UsersHelper.get_jwt_token(user.email)
    {
      Authorization: "Bearer #{token}"
    }
  end

  context '001 - GET /api/expense_categories' do
    before do
      get '/api/expense_categories', headers: headers
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getExpenseCategories')
      # expect(response_body['expense_categories'].present?).to be true
    end
  end
end
