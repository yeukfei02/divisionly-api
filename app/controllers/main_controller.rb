# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @message = 'divisionly-api'
    render :index, status: :ok
  end
end
