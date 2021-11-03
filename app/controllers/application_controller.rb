class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  before_action :default_json_format

  def default_json_format
    request.format = :json
  end
end
