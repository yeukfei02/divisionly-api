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
class Currency < ApplicationRecord
  # association
  has_one :expense

  # validation
  validates :symbol, presence: true
  validates :name, presence: true
  validates :symbol_native, presence: true
  validates :decimal_digits, presence: true, numericality: { only_integer: true }
  validates :rounding, presence: true, numericality: { only_integer: true }
  validates :code, presence: true
  validates :name_plural, presence: true
end
