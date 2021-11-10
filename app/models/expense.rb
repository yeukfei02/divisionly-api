# == Schema Information
#
# Table name: expenses
#
#  id                  :uuid             not null, primary key
#  description         :text             not null
#  amount              :float            not null
#  split_method        :text             not null
#  user_id             :uuid             not null
#  group_id            :uuid             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  expense_category_id :uuid
#  currency_id         :uuid
#
class Expense < ApplicationRecord
  enum expense_split_method: {
    method_1: 'you_paid_and_split_equally',
    method_2: 'you_owed_the_full_amount',
    method_3: 'friend_paid_and_split_equally',
    method_4: 'friend_owed_the_full_amount'
  }

  # association
  belongs_to :user
  belongs_to :group
  belongs_to :expense_category
  belongs_to :currency
  has_one_attached :image

  # callback
  before_validation :set_default_image

  # validation
  validates :description, presence: true
  validates :amount, presence: true, numericality: { only_float: true }
  validates :split_method, presence: true
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
