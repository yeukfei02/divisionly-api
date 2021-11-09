class FilesController < ApplicationController
  def upload
    file = params['file']

    if file.present?
      @message = 'file upload success'
      render :upload, status: 200
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'file upload error'
    @error = e.message.to_s
    render :upload, status: 400
  end
end
