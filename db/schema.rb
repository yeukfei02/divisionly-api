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

ActiveRecord::Schema.define(version: 2022_02_18_071824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["created_at"], name: "index_activities_on_created_at"
    t.index ["deleted_at"], name: "index_activities_on_deleted_at"
    t.index ["description"], name: "index_activities_on_description"
    t.index ["title"], name: "index_activities_on_title"
    t.index ["updated_at"], name: "index_activities_on_updated_at"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "iso"
    t.text "name"
    t.text "nice_name"
    t.string "iso3"
    t.integer "num_code"
    t.integer "phone_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_countries_on_created_at"
    t.index ["iso"], name: "index_countries_on_iso"
    t.index ["iso3"], name: "index_countries_on_iso3"
    t.index ["name"], name: "index_countries_on_name"
    t.index ["nice_name"], name: "index_countries_on_nice_name"
    t.index ["num_code"], name: "index_countries_on_num_code"
    t.index ["phone_code"], name: "index_countries_on_phone_code"
    t.index ["updated_at"], name: "index_countries_on_updated_at"
  end

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "symbol", null: false
    t.string "name", null: false
    t.string "symbol_native", null: false
    t.integer "decimal_digits", null: false
    t.integer "rounding", null: false
    t.string "code", null: false
    t.string "name_plural", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_currencies_on_code"
    t.index ["created_at"], name: "index_currencies_on_created_at"
    t.index ["decimal_digits"], name: "index_currencies_on_decimal_digits"
    t.index ["name"], name: "index_currencies_on_name"
    t.index ["name_plural"], name: "index_currencies_on_name_plural"
    t.index ["rounding"], name: "index_currencies_on_rounding"
    t.index ["symbol"], name: "index_currencies_on_symbol"
    t.index ["symbol_native"], name: "index_currencies_on_symbol_native"
    t.index ["updated_at"], name: "index_currencies_on_updated_at"
  end

  create_table "expense_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "expense_category_group", null: false
    t.text "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_expense_categories_on_created_at"
    t.index ["expense_category_group"], name: "index_expense_categories_on_expense_category_group"
    t.index ["name"], name: "index_expense_categories_on_name"
    t.index ["updated_at"], name: "index_expense_categories_on_updated_at"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "description", null: false
    t.float "amount", null: false
    t.text "split_method", null: false
    t.uuid "user_id", null: false
    t.uuid "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "expense_category_id"
    t.uuid "currency_id"
    t.uuid "friend_id"
    t.index ["amount"], name: "index_expenses_on_amount"
    t.index ["created_at"], name: "index_expenses_on_created_at"
    t.index ["currency_id"], name: "index_expenses_on_currency_id"
    t.index ["description"], name: "index_expenses_on_description"
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["friend_id"], name: "index_expenses_on_friend_id"
    t.index ["group_id"], name: "index_expenses_on_group_id"
    t.index ["split_method"], name: "index_expenses_on_split_method"
    t.index ["updated_at"], name: "index_expenses_on_updated_at"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "friends", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.integer "phone_number", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_friends_on_created_at"
    t.index ["description"], name: "index_friends_on_description"
    t.index ["name"], name: "index_friends_on_name"
    t.index ["phone_number"], name: "index_friends_on_phone_number"
    t.index ["updated_at"], name: "index_friends_on_updated_at"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.text "group_type", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_groups_on_created_at"
    t.index ["description"], name: "index_groups_on_description"
    t.index ["group_type"], name: "index_groups_on_group_type"
    t.index ["name"], name: "index_groups_on_name"
    t.index ["updated_at"], name: "index_groups_on_updated_at"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "email", null: false
    t.text "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["is_admin"], name: "index_users_on_is_admin"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["password"], name: "index_users_on_password"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "users"
  add_foreign_key "expenses", "currencies"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "friends"
  add_foreign_key "expenses", "groups"
  add_foreign_key "expenses", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "groups", "users"
end
