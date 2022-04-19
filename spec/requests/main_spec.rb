# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mains', type: :request do
  context '001 - GET /' do
    before do
      get '/'
    end

    it 'return success' do
      assert_result(response)
    end
  end

  context '002 - GET /api' do
    before do
      get '/api'
    end

    it 'return success' do
      assert_result(response)
    end
  end

  def assert_result(response)
    response_body = JSON.parse(response.body)
    puts "response_body = #{response_body}"
    expect(response_body.present?).to be true

    expect(response_body['message']).to eq('divisionly-api')
  end
end
