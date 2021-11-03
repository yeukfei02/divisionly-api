class MainController < ApplicationController
  def index
    @message = 'divisionly-api'
    render :index, status: 200
  end
end
