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
  pending "add some examples to (or delete) #{__FILE__}"
end
