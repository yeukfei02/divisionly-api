# frozen_string_literal: true

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
  let!(:currency) do
    create(:currency)
  end

  context 'associations' do
    it { is_expected.to have_one(:expense).class_name('Expense') }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:symbol) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:symbol_native) }

    it { is_expected.to validate_presence_of(:decimal_digits) }
    it { is_expected.to validate_numericality_of(:decimal_digits).only_integer }

    it { is_expected.to validate_presence_of(:rounding) }
    it { is_expected.to validate_numericality_of(:rounding).only_integer }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name_plural) }
  end
end
