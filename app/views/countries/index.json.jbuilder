# frozen_string_literal: true

json.message @message
json.countries @countries if @countries.present?
json.error @error if @error.present?
