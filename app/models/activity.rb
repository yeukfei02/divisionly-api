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

  # callback
  before_validation :set_default_image

  # validation
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                    file_content_type: { allow: %w[image/jpeg image/png] }

  private

  def set_default_image
    if Rails.env == 'test' && !image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'activity.jpg')),
                   filename: 'activity.jpg', content_type: 'image/jpg')
    end
  end
end
