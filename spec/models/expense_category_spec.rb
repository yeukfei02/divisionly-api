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
  let!(:expense_category) do
    create(:expense_category)
  end

  describe 'associations' do
    it { is_expected.to have_one(:expense).class_name('Expense') }
    it { is_expected.to have_one_attached(:image) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:expense_category_group) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
