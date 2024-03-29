# frozen_string_literal: true

# == Schema Information
#
# Table name: countries
#
#  id         :uuid             not null, primary key
#  iso        :string
#  name       :text
#  nice_name  :text
#  iso3       :string
#  num_code   :integer
#  phone_code :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Country, type: :model do
end
