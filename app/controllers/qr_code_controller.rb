class QrCodeController < AuthApiController
  def generate_qr_code
    user_id = params['user_id']

    uuid = SecureRandom.uuid
    @qr_code_str = "#{uuid}-#{user_id}"

    @message = 'generateQRCode'
    render :generate_qr_code, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'generateQRCode error'
    @error = e.message.to_s
    render :generate_qr_code, status: 400
  end
end
