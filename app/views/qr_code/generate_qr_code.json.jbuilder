# frozen_string_literal: true

json.message @message
json.qr_code_str @qr_code_str
json.error @error if @error.present?
