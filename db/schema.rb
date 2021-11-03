# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_103_163_603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'activities', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'title', null: false
    t.text 'description', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_activities_on_user_id'
  end

  create_table 'expenses', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'description', null: false
    t.float 'amount', null: false
    t.text 'split_method', null: false
    t.uuid 'user_id', null: false
    t.uuid 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_expenses_on_group_id'
    t.index ['user_id'], name: 'index_expenses_on_user_id'
  end

  create_table 'friends', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'title', null: false
    t.text 'description', null: false
    t.integer 'phone_number', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_friends_on_user_id'
  end

  create_table 'groups', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'name', null: false
    t.text 'description', null: false
    t.text 'type', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_groups_on_user_id'
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'email', null: false
    t.text 'password', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'activities', 'users'
  add_foreign_key 'expenses', 'groups'
  add_foreign_key 'expenses', 'users'
  add_foreign_key 'friends', 'users'
  add_foreign_key 'groups', 'users'
end
