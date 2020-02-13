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

ActiveRecord::Schema.define(version: 2020_02_13_131942) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "firstname", limit: 50
    t.string "lastname", limit: 50
  end

  create_table "order_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "item_price", precision: 10
    t.bigint "orders_id"
    t.bigint "products_id"
    t.index ["orders_id"], name: "index_order_items_on_orders_id"
    t.index ["products_id"], name: "index_order_items_on_products_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "shipped_at"
    t.string "status", limit: 50
    t.bigint "clients_id"
    t.index ["clients_id"], name: "index_orders_on_clients_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.decimal "price", precision: 10
    t.string "description"
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_products_on_categories_id"
  end

  add_foreign_key "order_items", "orders", column: "orders_id"
  add_foreign_key "order_items", "products", column: "products_id"
  add_foreign_key "orders", "clients", column: "clients_id"
  add_foreign_key "products", "categories", column: "categories_id"
end
