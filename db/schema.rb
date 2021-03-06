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

ActiveRecord::Schema.define(version: 2020_03_11_142327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "category"
    t.string "open_until"
    t.string "open_weekly"
    t.boolean "open_today"
    t.integer "price"
    t.float "rating"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected", default: false
  end

  create_table "drink_stops", force: :cascade do |t|
    t.bigint "drink_id"
    t.bigint "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_drink_stops_on_drink_id"
    t.index ["stop_id"], name: "index_drink_stops_on_stop_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
  end

  create_table "stops", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "bar_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_stops_on_bar_id"
    t.index ["group_id"], name: "index_stops_on_group_id"
  end

  add_foreign_key "drink_stops", "drinks"
  add_foreign_key "drink_stops", "stops"
  add_foreign_key "members", "groups"
  add_foreign_key "stops", "bars"
  add_foreign_key "stops", "groups"
end
