# == Schema Information
#
# Table name: friends
#
#  id           :uuid             not null, primary key
#  name         :text             not null
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

  # callback
  before_validation :set_default_avatar

  # validation
  validates :name, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :avatar, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                     file_content_type: { allow: %w[image/jpeg image/png] }

  private

  def set_default_avatar
    unless avatar.attached? && Rails.env == 'test'
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'friend.jpg')),
                    filename: 'friend.jpg', content_type: 'image/jpg')
    end
  end
end
