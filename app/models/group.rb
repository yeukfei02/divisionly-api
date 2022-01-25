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
  has_many :expenses, dependent: :destroy
  has_one_attached :image

  # callback
  before_validation :set_default_image

  # validation
  validates :name, presence: true
  validates :description, presence: true
  validates :group_type, presence: true, inclusion: { in: types.keys }
  validates :image, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                    file_content_type: { allow: %w[image/jpeg image/png] }

  private

  def set_default_image
    if Rails.env.test? && !image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_group.jpg')),
                   filename: 'dummy_group.jpg', content_type: 'image/jpg')
    end
  end
end
