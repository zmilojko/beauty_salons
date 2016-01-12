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

ActiveRecord::Schema.define(version: 20160112171218) do

  create_table "prices", force: :cascade do |t|
    t.integer  "price"
    t.integer  "salon_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prices", ["salon_id", "service_id"], name: "index_prices_on_salon_id_and_service_id", unique: true
  add_index "prices", ["salon_id"], name: "index_prices_on_salon_id"
  add_index "prices", ["service_id"], name: "index_prices_on_service_id"

  create_table "salons", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "permalink"
  end

  add_index "salons", ["permalink"], name: "index_salons_on_permalink", unique: true

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "services", ["slug"], name: "index_services_on_slug", unique: true

end
