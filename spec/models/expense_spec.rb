# == Schema Information
#
# Table name: expenses
#
#  id           :uuid             not null, primary key
#  description  :text             not null
#  amount       :float            not null
#  split_method :text             not null
#  user_id      :uuid             not null
#  group_id     :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Expense, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
