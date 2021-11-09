# == Schema Information
#
# Table name: expense_categories
#
#  id                     :uuid             not null, primary key
#  expense_category_group :text             not null
#  name                   :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
