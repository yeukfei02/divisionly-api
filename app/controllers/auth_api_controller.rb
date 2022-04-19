# frozen_string_literal: true

class AuthApiController < ApplicationController
  before_action :validate_jwt_token

  def validate_jwt_token
    if request.authorization.present?
      token = request.authorization.gsub('Bearer ', '').strip
      Rails.logger.debug "token = #{token}"

      if token.present?
        jwt_secret = ENV['JWT_SECRET']
        decoded = JWT.decode token, jwt_secret, true, { algorithm: 'HS256' }
        Rails.logger.debug "decoded = #{decoded}"

        if decoded.blank?
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
    Rails.logger.debug "error = #{e}"

    data = {
      'message': 'Unauthorized, validate_jwt_token error',
      'error': e.message.to_s
    }
    render json: data, status: :bad_request
  end
end
