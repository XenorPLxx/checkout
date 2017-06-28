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

ActiveRecord::Schema.define(version: 20170628180032) do

  create_table "check_out_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "check_out_id"
    t.date "date_added"
    t.date "date_hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_out_id"], name: "index_check_out_products_on_check_out_id"
    t.index ["product_id"], name: "index_check_out_products_on_product_id"
  end

  create_table "check_outs", force: :cascade do |t|
    t.date "date_started"
    t.date "date_closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "final_total", precision: 15, scale: 2
  end

  create_table "currencies", force: :cascade do |t|
    t.string "abbr"
    t.string "description"
    t.boolean "is_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.decimal "value_in_base", precision: 15, scale: 2
  end

  create_table "custom_rules", force: :cascade do |t|
    t.integer "product_id"
    t.text "rule"
    t.date "date_from"
    t.date "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_custom_rules_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "currency_id"
    t.decimal "price", precision: 15, scale: 2
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_products_on_currency_id"
  end

  create_table "rules", force: :cascade do |t|
    t.integer "product_id"
    t.integer "count"
    t.date "date_from"
    t.date "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 15, scale: 2
    t.index ["product_id"], name: "index_rules_on_product_id"
  end

end
