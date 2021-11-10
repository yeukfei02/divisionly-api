require 'rails_helper'

RSpec.describe "ExpenseCategories", type: :request do
  before(:all) do
    @user = create(:user)

    token = UsersHelper.get_jwt_token(@user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - GET /api/expense_categories' do
    before do
      get '/api/expense_categories', headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getExpenseCategories')
      # expect(response_body['expense_categories'].present?).to be true
    end
  end
end
