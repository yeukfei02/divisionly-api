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
  belongs_to :expense
  has_one_attached :image

  # callback
  before_validation :set_default_image

  # validation
  validates :expense_category_group, presence: true
  validates :name, presence: true

  private

  def set_default_image
    if Rails.env == 'test' && !image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_expense.jpg')),
                   filename: 'dummy_expense.jpg', content_type: 'image/jpg')
    end
  end
end
