# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  before_action :default_json_format

  def default_json_format
    request.format = :json
  end
end
