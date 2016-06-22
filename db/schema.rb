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

ActiveRecord::Schema.define(version: 20160614123007) do

  create_table "calendars", force: :cascade do |t|
    t.string  "tytul",      limit: 50,   null: false
    t.string  "opis",       limit: 1000, null: false
    t.string  "godzina",    limit: 10,   null: false
    t.integer "idharcerza", limit: 4
    t.date    "event_date",              null: false
  end

  add_index "calendars", ["idharcerza"], name: "id_harcerze_idx", using: :btree
  add_index "calendars", ["idharcerza"], name: "idx_calendars_id_harcerza", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "nazwa", limit: 100,  null: false
    t.string "opis",  limit: 1000, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "nazwa",              limit: 255, null: false
    t.integer  "id_autora",          limit: 4,   null: false
    t.string   "cover_file_name",    limit: 255
    t.string   "cover_content_type", limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  add_index "galleries", ["id_autora"], name: "gallery_user_idx", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "id_dodajacego",        limit: 4
    t.integer  "id_galerii",           limit: 4
    t.string   "zdjecie_file_name",    limit: 255
    t.string   "zdjecie_content_type", limit: 255
    t.integer  "zdjecie_file_size",    limit: 4
    t.datetime "zdjecie_updated_at"
  end

  add_index "photos", ["id_dodajacego"], name: "photos_users_idx", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string  "tytul",        limit: 100,  null: false
    t.integer "id_autora",    limit: 4,    null: false
    t.string  "opis",         limit: 5000, null: false
    t.integer "kategoria",    limit: 4,    null: false
    t.date    "data_dodania",              null: false
  end

  add_index "posts", ["id_autora"], name: "post_user_idx", using: :btree

  create_table "scouts", force: :cascade do |t|
    t.string  "imie",     limit: 50, null: false
    t.string  "nazwisko", limit: 50, null: false
    t.integer "zastep",   limit: 4,  null: false
    t.integer "wiek",     limit: 4,  null: false
    t.string  "pesel",    limit: 11
  end

  create_table "units", force: :cascade do |t|
    t.string  "Nazwa",     limit: 80,  null: false
    t.integer "Zastepowy", limit: 4,   null: false
    t.string  "opis",      limit: 500, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "imie",            limit: 30,  null: false
    t.string  "nazwisko",        limit: 50,  null: false
    t.string  "login",           limit: 255, null: false
    t.string  "email",           limit: 255, null: false
    t.string  "password_digest", limit: 255, null: false
    t.integer "id_zastepu",      limit: 4
  end

  add_foreign_key "calendars", "scouts", column: "idharcerza", name: "id_harcerze"
  add_foreign_key "galleries", "users", column: "id_autora", name: "gallery_user"
  add_foreign_key "photos", "users", column: "id_dodajacego", name: "photos_users"
  add_foreign_key "posts", "users", column: "id_autora", name: "post_user"
end
