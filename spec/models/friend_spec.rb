# == Schema Information
#
# Table name: friends
#
#  id           :uuid             not null, primary key
#  title        :text             not null
#  description  :text             not null
#  phone_number :integer          not null
#  user_id      :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Friend, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
