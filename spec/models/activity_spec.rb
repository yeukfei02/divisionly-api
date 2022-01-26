# == Schema Information
#
# Table name: activities
#
#  id          :uuid             not null, primary key
#  title       :text             not null
#  description :text             not null
#  user_id     :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
require 'rails_helper'

RSpec.describe Activity, type: :model do
  let!(:activity) do
    create(:activity)
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).class_name('User') }
    it { is_expected.to have_one_attached(:image) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
