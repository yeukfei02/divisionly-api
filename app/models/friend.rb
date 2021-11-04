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
class Friend < ApplicationRecord
  # association
  belongs_to :user

  has_one_attached :avatar

  # validation
  validates :title, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :avatar, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                     file_content_type: { allow: %w[image/jpeg image/png] }
end
