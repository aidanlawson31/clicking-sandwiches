# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_14_075358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "business_display_attributes", force: :cascade do |t|
    t.bigint "business_id"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "background_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "font_id"
    t.string "heading_color"
    t.string "nav_bar_color"
    t.string "general_text_color"
    t.index ["business_id"], name: "index_business_display_attributes_on_business_id"
    t.index ["font_id"], name: "index_business_display_attributes_on_font_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_url"
    t.text "description"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_sequence_number"
    t.index ["menu_id"], name: "index_categories_on_menu_id"
  end

  create_table "fonts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_images", force: :cascade do |t|
    t.bigint "location_id"
    t.integer "display_sequence_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_images_on_location_id"
  end

  create_table "location_menus", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_menus_on_location_id"
    t.index ["menu_id"], name: "index_location_menus_on_menu_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_url"
    t.string "phone_number"
    t.float "latitude"
    t.float "longitude"
    t.string "open"
    t.index ["business_id"], name: "index_locations_on_business_id"
  end

  create_table "menu_item_options", force: :cascade do |t|
    t.bigint "menu_item_id"
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_sequence_number"
    t.index ["menu_item_id"], name: "index_menu_item_options_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "code"
    t.integer "display_sequence_number"
    t.boolean "item_options"
    t.index ["category_id"], name: "index_menu_items_on_category_id"
    t.index ["code"], name: "index_menu_items_on_code"
  end

  create_table "menus", force: :cascade do |t|
    t.string "internal_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "business_id"
    t.string "menu_url"
    t.string "description"
    t.string "display_name"
    t.index ["business_id"], name: "index_menus_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.bigint "business_id"
    t.string "first_name"
    t.string "last_name"
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "business_display_attributes", "businesses"
  add_foreign_key "business_display_attributes", "fonts"
  add_foreign_key "categories", "menus"
  add_foreign_key "location_images", "locations"
  add_foreign_key "location_menus", "locations"
  add_foreign_key "location_menus", "menus"
  add_foreign_key "locations", "businesses"
  add_foreign_key "menu_item_options", "menu_items"
  add_foreign_key "menu_items", "categories"
  add_foreign_key "menus", "businesses"
  add_foreign_key "users", "businesses"
end
