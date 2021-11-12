require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:all) do
    @expense = create(:expense)
    @expense_category = create(:expense_category)
    @currency = create(:currency)

    token = UsersHelper.get_jwt_token(@expense.user.email)
    @headers = {
      Authorization: "Bearer #{token}"
    }
  end

  describe '001 - POST /api/expenses' do
    before do
      params = {
        description: @expense.description,
        amount: @expense.amount,
        split_method: @expense.split_method,
        user_id: @expense.user_id,
        friend_id: @expense.friend_id,
        group_id: @expense.group_id,
        expense_category_id: @expense_category.id,
        currency_id: @currency.id
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

  describe '002 - GET /api/expenses' do
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

  describe '003 - GET /api/expenses/:id' do
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

  describe '004 - PUT /api/expenses/:id' do
    before do
      params = {
        description: "#{@expense.description}-test",
        amount: 200.22,
        split_method: Expense.expense_split_methods['method_3'],
        user_id: @expense.user.id
      }
      put "/api/expenses/#{@expense.id}", params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('updateExpenseById')
    end
  end

  describe '005 - POST /api/expenses/remove' do
    before do
      params = {
        id: @expense.id,
        user_id: @expense.user_id
      }
      post "/api/expenses/remove", params: params, headers: @headers
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('deleteExpenseById')
    end
  end
end
