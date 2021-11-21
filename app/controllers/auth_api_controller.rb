class AuthApiController < ApplicationController
  before_action :validate_jwt_token

  def validate_jwt_token
    if request.authorization.present?
      token = request.authorization.gsub('Bearer ', '').strip
      puts "token = #{token}"

      if token.present?
        jwt_secret = ENV['JWT_SECRET']
        decoded = JWT.decode token, jwt_secret, true, { algorithm: 'HS256' }
        puts "decoded = #{decoded}"

        unless decoded.present?
          data = {
            'message': 'Unauthorized, please check request authorization header'
          }
          render json: data, status: :bad_request
        end
      end
    else
      data = {
        'message': 'Unauthorized, please enter request authorization header'
      }
      render json: data, status: :bad_request
    end
  rescue StandardError => e
    puts "error = #{e}"

    data = {
      'message': 'Unauthorized, validate_jwt_token error',
      'error': e.message.to_s
    }
    render json: data, status: :bad_request
  end
end
