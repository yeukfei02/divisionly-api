# == Schema Information
#
# Table name: expenses
#
#  id                  :uuid             not null, primary key
#  description         :text             not null
#  amount              :float            not null
#  split_method        :text             not null
#  user_id             :uuid             not null
#  group_id            :uuid             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  expense_category_id :uuid
#  currency_id         :uuid
#  friend_id           :uuid
#
require 'rails_helper'

RSpec.describe Expense, type: :model do
  # let!(:expense_category) do
  #   create(:expense_category)
  # end
  # let!(:expense) do
  #   create(:expense, expense_category: expense_category)
  # end
  #
  # describe 'associations' do
  #   it { is_expected.to belong_to(:user).class_name('User') }
  #   it { is_expected.to belong_to(:friend).class_name('Friend') }
  #   it { is_expected.to belong_to(:group).class_name('Group') }
  #   it { is_expected.to belong_to(:expense_category).class_name('ExpenseCategory') }
  #   it { is_expected.to belong_to(:currency).class_name('Currency') }
  #   it { is_expected.to have_one_attached(:image) }
  # end
  #
  # describe 'validations' do
  #   it { is_expected.to validate_presence_of(:description) }
  #
  #   it { is_expected.to validate_presence_of(:amount) }
  #   it { is_expected.to validate_numericality_of(:amount) }
  #
  #   it { is_expected.to validate_presence_of(:split_method) }
  #   it { is_expected.to validate_inclusion_of(:split_method).in_array(Expense.expense_split_methods.keys) }
  # end
end
