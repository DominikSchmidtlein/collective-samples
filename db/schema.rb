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

ActiveRecord::Schema.define(version: 20180519232459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "partnerships", force: :cascade do |t|
    t.bigint "vendor_shop_id"
    t.bigint "supplier_shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_shop_id"], name: "index_partnerships_on_supplier_shop_id"
    t.index ["vendor_shop_id", "supplier_shop_id"], name: "index_partnerships_on_vendor_shop_id_and_supplier_shop_id", unique: true
    t.index ["vendor_shop_id"], name: "index_partnerships_on_vendor_shop_id"
  end

  create_table "samples", force: :cascade do |t|
    t.integer "shopify_product_id"
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

  add_foreign_key "partnerships", "shops", column: "supplier_shop_id"
  add_foreign_key "partnerships", "shops", column: "vendor_shop_id"
end
