class FilesController < ApplicationController
  def upload
    file = params['file']

    if file.present?
      @message = 'file upload success'
      render :upload, status: :ok
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'file upload error'
    @error = e.message.to_s
    render :upload, status: :bad_request
  end
end
