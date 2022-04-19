# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create admin user
hash_password = UsersHelper.get_hash_password(ENV['ADMIN_PASSWORD'])

user = User.new
user.email = 'admin@admin.com'
user.password = hash_password
user.first_name = 'Super'
user.last_name = 'Admin'
user.is_admin = true
user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy_profile.jpg')),
                   filename: 'dummy_profile.jpg', content_type: 'image/jpg')
user.save!
