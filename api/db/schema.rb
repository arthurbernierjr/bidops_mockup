# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_05_171138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_item_ledgers", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_item_ledgers_on_category_id"
    t.index ["item_id"], name: "index_category_item_ledgers_on_item_id"
  end

  create_table "data_attributes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_properties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_attribute_ledgers", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "data_attribute_id", null: false
    t.string "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_attribute_id"], name: "index_item_attribute_ledgers_on_data_attribute_id"
    t.index ["item_id"], name: "index_item_attribute_ledgers_on_item_id"
  end

  create_table "item_data_property_ledgers", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "data_property_id", null: false
    t.float "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_property_id"], name: "index_item_data_property_ledgers_on_data_property_id"
    t.index ["item_id"], name: "index_item_data_property_ledgers_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "category_item_ledgers", "categories"
  add_foreign_key "category_item_ledgers", "items"
  add_foreign_key "item_attribute_ledgers", "data_attributes"
  add_foreign_key "item_attribute_ledgers", "items"
  add_foreign_key "item_data_property_ledgers", "data_properties"
  add_foreign_key "item_data_property_ledgers", "items"
end
