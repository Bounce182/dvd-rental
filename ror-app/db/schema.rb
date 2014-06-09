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

ActiveRecord::Schema.define(version: 20140609200115) do

  create_table "dvds", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "year",        limit: 4
    t.string   "lang",        limit: 8
    t.integer  "length",      limit: 3
    t.decimal  "rent_price",            precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dvds_genres", id: false, force: true do |t|
    t.integer "dvd_id"
    t.integer "genre_id"
  end

  add_index "dvds_genres", ["dvd_id", "genre_id"], name: "index_dvds_genres_on_dvd_id_and_genre_id"

  create_table "dvds_users", id: false, force: true do |t|
    t.integer "dvd_id"
    t.integer "user_id"
    t.date    "rent_date"
    t.date    "return_date"
  end

  add_index "dvds_users", ["dvd_id", "user_id"], name: "index_dvds_users_on_dvd_id_and_user_id"

  create_table "genres", force: true do |t|
    t.string   "title",      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",       limit: 50
    t.string   "surname",    limit: 50
    t.string   "email",      limit: 100
    t.string   "password"
    t.string   "phone",      limit: 20
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
