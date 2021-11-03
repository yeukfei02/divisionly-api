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
#
class Activity < ApplicationRecord
  # association
  belongs_to :user

  has_one_attached :image
  has_one_attached :avatar

  # validation
  validates :title, presence: true
  validates :description, presence: true
end
