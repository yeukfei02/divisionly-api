# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id          :uuid             not null, primary key
#  name        :text             not null
#  description :text             not null
#  group_type  :text             not null
#  user_id     :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:group) do
    create(:group)
  end

  context 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to have_many(:expenses).class_name('Expense') }
    it { is_expected.to have_one_attached(:image) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:group_type) }
    it { is_expected.to validate_inclusion_of(:group_type).in_array(described_class.types.keys) }
  end
end
