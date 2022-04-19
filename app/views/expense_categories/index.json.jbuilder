# frozen_string_literal: true

json.message @message
json.expense_categories @expense_categories if @expense_categories.present?
json.error @error if @error.present?
