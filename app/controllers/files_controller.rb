# frozen_string_literal: true

class FilesController < ApplicationController
  def upload
    params.require(:file)

    file = params['file']

    if file.present?
      @message = 'file upload success'
      render :upload, status: :ok
    end
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'file upload error'
    @error = e.message.to_s
    render :upload, status: :bad_request
  end
end
