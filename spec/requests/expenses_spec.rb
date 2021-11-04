require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:all) do
    @expense = create(:expense)

    token = UsersHelper.get_jwt_token(@expense.user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe 'POST /api/expenses' do
    before do
      params = {
        description: @expense.description,
        amount: @expense.amount,
        split_method: @expense.split_method,
        user_id: @expense.user_id,
        group_id: @expense.group_id
      }
      post '/api/expenses', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('createExpense')
    end
  end

  describe 'GET /api/expenses' do
    before do
      params = {
        user_id: @expense.user.id
      }
      get '/api/expenses', params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getExpenses')
      expect(response_body['expenses'].present?).to be true
    end
  end

  describe 'GET /api/expenses/:id' do
    before do
      get "/api/expenses/#{@expense.id}", headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('getExpenseById')
      expect(response_body['expense'].present?).to be true
    end
  end
end
