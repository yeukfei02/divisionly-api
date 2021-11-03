class Friend < ApplicationRecord
  # association
  belongs_to :user

  has_one_attached :image

  # validation
  validates :title, presence: true
  validates :description, presence: true
end
