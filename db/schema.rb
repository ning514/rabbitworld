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

ActiveRecord::Schema[7.0].define(version: 2022_02_28_080755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "orderlist_dtls", force: :cascade do |t|
    t.integer "list_id"
    t.integer "prod_id"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orderlists", force: :cascade do |t|
    t.string "order_num"
    t.integer "user_id"
    t.date "buy_date"
    t.string "buy_name"
    t.string "buy_email"
    t.string "buy_address"
    t.string "buy_tel"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "color"
    t.integer "age"
    t.text "remark"
    t.integer "votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "desc"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit"
    t.string "unit_qty"
    t.integer "ttl_qty"
    t.string "active"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "psw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "priv"
  end

end
