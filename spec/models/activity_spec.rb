# == Schema Information
#
# Table name: activities
#
#  id          :uuid             not null, primary key
#  title       :text             not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
