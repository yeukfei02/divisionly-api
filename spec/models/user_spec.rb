# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :text             not null
#  password   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :text             not null
#  last_name  :text             not null
#  is_admin   :boolean          default(FALSE), not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  context 'associations' do
    it { is_expected.to have_many(:groups).class_name('Group') }
    it { is_expected.to have_many(:friends).class_name('Friend') }
    it { is_expected.to have_many(:activities).class_name('Activity') }
    it { is_expected.to have_many(:expenses).class_name('Expense') }
    it { is_expected.to have_one_attached(:avatar) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }

    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to validate_inclusion_of(:is_admin).in_array([true, false]) }
  end
end
