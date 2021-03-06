# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140528011318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.string   "state",      limit: 2
  end

  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_orders", force: true do |t|
    t.integer "item_id"
    t.integer "order_id"
  end

  add_index "items_orders", ["item_id"], name: "index_items_orders_on_item_id", using: :btree
  add_index "items_orders", ["order_id"], name: "index_items_orders_on_order_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
