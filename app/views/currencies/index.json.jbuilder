# frozen_string_literal: true

json.message @message
json.currencies @currencies if @currencies.present?
json.error @error if @error.present?
