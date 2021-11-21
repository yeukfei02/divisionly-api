# require 'rails_helper'
#
# RSpec.describe 'Contacts', type: :request do
#   before(:all) do
#     @user = create(:user)
#
#     token = UsersHelper.get_jwt_token(@user.email)
#     @headers = {
#       Authorization: "Bearer #{token}"
#     }
#   end
#
#   describe '001 - POST /api/contact' do
#     before do
#       params = {
#         user_id: @user.id,
#         subject: 'test subject',
#         message: 'test message'
#       }
#       post '/api/contact', params: params, headers: @headers
#     end
#
#     it 'test result' do
#       response_body = JSON.parse(response.body)
#       puts "response_body = #{response_body}"
#       expect(response_body.present?).to be true
#
#       expect(response_body['message']).to eq('contactDivisionlySupport')
#     end
#   end
# end