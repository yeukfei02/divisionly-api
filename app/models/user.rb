# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :text             not null
#  password   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # association
  has_many :activities

  # validation
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
