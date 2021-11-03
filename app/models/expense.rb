# == Schema Information
#
# Table name: expenses
#
#  id           :uuid             not null, primary key
#  description  :text             not null
#  amount       :float            not null
#  split_method :text             not null
#  user_id      :uuid             not null
#  group_id     :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Expense < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :group

  has_one_attached :image

  # validation
  validates :description, presence: true
  validates :amount, presence: true, numericality: { only_float: true }
  validates :split_method, presence: true
end
