require 'rails_helper'

RSpec.describe 'Mains', type: :request do
  describe '001 - GET /' do
    before do
      get '/'
    end

    it 'test result' do
      assert_result(response)
    end
  end

  describe '002 - GET /api' do
    before do
      get '/api'
    end

    it 'test result' do
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
