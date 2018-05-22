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

ActiveRecord::Schema.define(version: 20180522154024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "partnerships", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_partnerships_on_supplier_id"
    t.index ["vendor_id", "supplier_id"], name: "index_partnerships_on_vendor_id_and_supplier_id", unique: true
    t.index ["vendor_id"], name: "index_partnerships_on_vendor_id"
  end

  create_table "partnerships_samples", id: false, force: :cascade do |t|
    t.bigint "partnership_id", null: false
    t.bigint "sample_id", null: false
  end

  create_table "sample_orders", force: :cascade do |t|
    t.integer "status", null: false
    t.bigint "shopify_order_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_sample_orders_on_shop_id"
    t.index ["status"], name: "index_sample_orders_on_status"
  end

  create_table "sample_orders_samples", id: false, force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.bigint "sample_order_id", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.bigint "shopify_product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_product_id"], name: "index_samples_on_shopify_product_id", unique: true
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  add_foreign_key "partnerships", "shops", column: "supplier_id"
  add_foreign_key "partnerships", "shops", column: "vendor_id"
  add_foreign_key "sample_orders", "shops"
end
