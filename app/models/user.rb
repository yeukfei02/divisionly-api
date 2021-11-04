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
  has_many :groups
  has_many :friends
  has_many :activities
  has_many :expenses

  has_one_attached :avatar

  # validation
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :avatar, presence: true
end
