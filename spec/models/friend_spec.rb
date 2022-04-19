# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id           :uuid             not null, primary key
#  name         :text             not null
#  description  :text             not null
#  phone_number :integer          not null
#  user_id      :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Friend, type: :model do
  let!(:friend) do
    create(:friend)
  end

  context 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to have_many(:expenses).class_name('Expense') }
    it { is_expected.to have_one_attached(:avatar) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_numericality_of(:phone_number).only_integer }
  end
end
