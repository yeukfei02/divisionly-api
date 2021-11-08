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

  # callback
  before_validation :set_default_avatar

  # validation
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :avatar, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                     file_content_type: { allow: %w[image/jpeg image/png] }

  private

  def set_default_avatar
    unless avatar.attached? && Rails.env == 'test'
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')),
                    filename: 'profile.jpg', content_type: 'image/jpg')
    end
  end
end
