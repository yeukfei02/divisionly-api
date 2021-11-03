# == Schema Information
#
# Table name: groups
#
#  id          :uuid             not null, primary key
#  name        :text             not null
#  description :text             not null
#  type        :text             not null
#  user_id     :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  enum type: %i[trip home couple other]

  # association
  belongs_to :user

  has_one_attached :image

  # validation
  validates :name, presence: true
  validates :description, presence: true
  validates :type, presence: true
end
