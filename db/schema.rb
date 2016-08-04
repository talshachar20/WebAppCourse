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

ActiveRecord::Schema.define(version: 20160803122712) do

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commenter",  limit: 255
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language",   limit: 255
    t.integer  "lang_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string "ip_start", limit: 255
    t.string "ip_end",   limit: 255
    t.string "country",  limit: 255
  end

  create_table "memo_cards", force: :cascade do |t|
    t.string   "word",        limit: 255
    t.integer  "word_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "translation", limit: 255
    t.integer  "lang_id",     limit: 4
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "word_id",    limit: 4
    t.integer  "is_correct", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "session_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",              limit: 255
    t.boolean  "admin",                  limit: 1
    t.integer  "user_rate",              limit: 4
    t.string   "user_last_login",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
