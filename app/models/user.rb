# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :text             not null
#  password   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :text             not null
#  last_name  :text             not null
#  is_admin   :boolean          default(FALSE), not null
#
class User < ApplicationRecord
  # association
  has_many :groups, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :expenses, dependent: :destroy

  has_one_attached :avatar

  # callback
  before_validation :set_default_avatar

  # validation
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :is_admin, inclusion: { in: [true, false] }
  validates :avatar, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                     file_content_type: { allow: %w[image/jpeg image/png] }

  def admin?
    is_admin
  end

  private

  def set_default_avatar
    if Rails.env == 'test' && !avatar.attached?
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_profile.jpg')),
                    filename: 'dummy_profile.jpg', content_type: 'image/jpg')
    end
  end
end
