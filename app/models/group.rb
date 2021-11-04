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
class Group < ApplicationRecord
  enum type: {
    trip: 'trip',
    home: 'home',
    couple: 'couple',
    other: 'other'
  }

  # association
  belongs_to :user

  has_one_attached :image

  # validation
  validates :name, presence: true
  validates :description, presence: true
  validates :group_type, presence: true
end
