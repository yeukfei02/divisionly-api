# frozen_string_literal: true

class QrCodeController < AuthApiController
  def generate_qr_code
    params.require(:user_id)

    user_id = params['user_id']

    uuid = SecureRandom.uuid
    @qr_code_str = "#{uuid}-#{user_id}"

    @message = 'generateQRCode'
    render :generate_qr_code, status: :ok
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'generateQRCode error'
    @error = e.message.to_s
    render :generate_qr_code, status: :bad_request
  end
end
