# == Schema Information
#
# Table name: currencies
#
#  id             :uuid             not null, primary key
#  symbol         :string           not null
#  name           :string           not null
#  symbol_native  :string           not null
#  decimal_digits :integer          not null
#  rounding       :integer          not null
#  code           :string           not null
#  name_plural    :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
