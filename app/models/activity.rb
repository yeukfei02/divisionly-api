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
    unless image.attached?
      if Rails.env == 'test'
        image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_activity.jpg')),
                     filename: 'dummy_activity.jpg', content_type: 'image/jpg')
      elsif description.include? 'group'
        image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'group.png')),
                     filename: 'group.png', content_type: 'image/png')
      elsif description.include? 'friend'
        image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'friend.png')),
                     filename: 'friend.png', content_type: 'image/png')
      elsif description.include? 'expense'
        image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense.png')),
                     filename: 'expense.png', content_type: 'image/png')
      end
    end
  end
end
