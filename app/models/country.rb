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
class Country < ApplicationRecord
  # validation
  validates :iso, presence: true
  validates :name, presence: true
  validates :nice_name, presence: true
  validates :iso3, allow_blank: true, allow_nil: true
  validates :num_code, allow_blank: true, allow_nil: true, numericality: { only_integer: true }
  validates :phone_code, presence: true, numericality: { only_integer: true }
end
