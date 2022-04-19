# frozen_string_literal: true

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

  def set_default_image
    unless image.attached?
      if Rails.env.test?
        set_dummy_image
      else
        case expense_category_group
        when 'Entertainment'
          set_entertainment_image
        when 'Food and drink'
          set_food_and_drink_image
        when 'Home'
          set_home_image
        when 'Life'
          set_life_image
        when 'Transportation'
          set_transportation_image
        when 'Uncategorized'
          set_uncategorized_image
        when 'Utilities'
          set_utilities_image
        else
          set_dummy_image
        end
      end
    end
  end

  def set_entertainment_image
    case name
    when 'Games'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'entertainment', 'games.png')),
                   filename: 'games.png', content_type: 'image/png')
    when 'Movies'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'entertainment', 'movies.png')),
                   filename: 'movies.png', content_type: 'image/png')
    when 'Music'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'entertainment', 'music.png')),
                   filename: 'music.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'entertainment', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Sports'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'entertainment', 'sports.png')),
                   filename: 'sports.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_food_and_drink_image
    case name
    when 'Groceries'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'food_and_drink', 'groceries.png')),
                   filename: 'groceries.png', content_type: 'image/png')
    when 'Dining out'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'food_and_drink', 'dining_out.png')),
                   filename: 'dining_out.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'food_and_drink', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Liquor'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'food_and_drink', 'liquor.png')),
                   filename: 'liquor.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_home_image
    case name
    when 'Rent'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'rent.png')),
                   filename: 'rent.png', content_type: 'image/png')
    when 'Mortgage'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'mortgage.png')),
                   filename: 'mortgage.png', content_type: 'image/png')
    when 'Household supplies'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'household_supplies.png')),
                   filename: 'household_supplies.png', content_type: 'image/png')
    when 'Furniture'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'furniture.png')),
                   filename: 'furniture.png', content_type: 'image/png')
    when 'Maintenance'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'maintenance.png')),
                   filename: 'maintenance.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Pets'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'pets.png')),
                   filename: 'pets.png', content_type: 'image/png')
    when 'Services'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'services.png')),
                   filename: 'services.png', content_type: 'image/png')
    when 'Electronics'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'home', 'electronics.png')),
                   filename: 'electronics.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_life_image
    case name
    when 'Insurance'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'insurance.png')),
                   filename: 'insurance.png', content_type: 'image/png')
    when 'Clothing'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'clothing.png')),
                   filename: 'clothing.png', content_type: 'image/png')
    when 'Gifts'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'gifts.png')),
                   filename: 'gifts.png', content_type: 'image/png')
    when 'Medical expenses'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'medical_expenses.png')),
                   filename: 'medical_expenses.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Taxes'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'taxes.png')),
                   filename: 'taxes.png', content_type: 'image/png')
    when 'Education'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'education.png')),
                   filename: 'education.png', content_type: 'image/png')
    when 'Childcare'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'life', 'childcare.png')),
                   filename: 'childcare.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_transportation_image
    case name
    when 'Parking'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'parking.png')),
                   filename: 'parking.png', content_type: 'image/png')
    when 'Car'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'car.png')),
                   filename: 'car.png', content_type: 'image/png')
    when 'Bus/train'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'bus_or_train.png')),
                   filename: 'bus_or_train.png', content_type: 'image/png')
    when 'Gas/fuel'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'gas_or_fuel.png')),
                   filename: 'gas_or_fuel.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Plane'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'plane.png')),
                   filename: 'plane.png', content_type: 'image/png')
    when 'Taxi'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'taxi.png')),
                   filename: 'taxi.png', content_type: 'image/png')
    when 'Bicycle'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'bicycle.png')),
                   filename: 'bicycle.png', content_type: 'image/png')
    when 'Hotel'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'transportation', 'hotel.png')),
                   filename: 'hotel.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_uncategorized_image
    case name
    when 'General'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'uncategorized', 'general.png')),
                   filename: 'general.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_utilities_image
    case name
    when 'Electricity'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'electricity.png')),
                   filename: 'electricity.png', content_type: 'image/png')
    when 'Heat/gas'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'heat_or_gas.png')),
                   filename: 'heat_or_gas.png', content_type: 'image/png')
    when 'Water'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'water.png')),
                   filename: 'water.png', content_type: 'image/png')
    when 'TV/Phone/Internet'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'tv_or_phone_or_internet.png')),
                   filename: 'tv_or_phone_or_internet.png', content_type: 'image/png')
    when 'Other'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'other.png')),
                   filename: 'other.png', content_type: 'image/png')
    when 'Trash'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'trash.png')),
                   filename: 'trash.png', content_type: 'image/png')
    when 'Cleaning'
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'expense_category', 'utilities', 'cleaning.png')),
                   filename: 'cleaning.png', content_type: 'image/png')
    else
      set_dummy_image
    end
  end

  def set_dummy_image
    image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_expense_category.jpg')),
                 filename: 'dummy_expense_category.jpg', content_type: 'image/jpg')
  end
end
