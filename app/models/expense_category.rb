# == Schema Information
#
# Table name: expense_categories
#
#  id                     :uuid             not null, primary key
#  expense_category_group :text             not null
#  name                   :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class ExpenseCategory < ApplicationRecord
  # association
  has_one :expense
  has_one_attached :image

  # callback
  before_validation :set_default_image

  # validation
  validates :expense_category_group, presence: true
  validates :name, presence: true
  validates :image, presence: true, file_size: { less_than_or_equal_to: 10.megabytes },
                    file_content_type: { allow: %w[image/jpeg image/png] }

  private

  def set_default_image
    if Rails.env == 'test' && !image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_expense.jpg')),
                   filename: 'dummy_expense.jpg', content_type: 'image/jpg')
    end
  end
end
