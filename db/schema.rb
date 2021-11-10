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

ActiveRecord::Schema.define(version: 20_211_110_030_250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'active_storage_attachments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.uuid 'record_id', null: false
    t.uuid 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'activities', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'title', null: false
    t.text 'description', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_activities_on_user_id'
  end

  create_table 'countries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'iso'
    t.text 'name'
    t.text 'nice_name'
    t.string 'iso3'
    t.integer 'num_code'
    t.integer 'phone_code'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'currencies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'symbol', null: false
    t.string 'name', null: false
    t.string 'symbol_native', null: false
    t.integer 'decimal_digits', null: false
    t.integer 'rounding', null: false
    t.string 'code', null: false
    t.string 'name_plural', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'expense_categories', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.text 'expense_category_group', null: false
    t.text 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
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
    t.text 'name', null: false
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
    t.text 'group_type', null: false
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
    t.text 'first_name', null: false
    t.text 'last_name', null: false
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'activities', 'users'
  add_foreign_key 'expenses', 'groups'
  add_foreign_key 'expenses', 'users'
  add_foreign_key 'friends', 'users'
  add_foreign_key 'groups', 'users'
end
