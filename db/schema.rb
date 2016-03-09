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

ActiveRecord::Schema.define(version: 20160309210422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.string   "assigned_user"
    t.datetime "expiration_date"
    t.string   "message"
    t.string   "challenge_video"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "status",                    default: 0
    t.integer  "challenger_guess"
    t.integer  "challengee_guess"
    t.integer  "odds"
    t.string   "response_video"
    t.string   "response_message"
    t.string   "image_upload_file_name"
    t.string   "image_upload_content_type"
    t.integer  "image_upload_file_size"
    t.datetime "image_upload_updated_at"
  end

  add_index "challenges", ["user_id"], name: "index_challenges_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headshot_photos", force: :cascade do |t|
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "capturable_id"
    t.string   "capturable_type"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "challenge_id"
    t.string   "image_upload_file_name"
    t.string   "image_upload_content_type"
    t.integer  "image_upload_file_size"
    t.datetime "image_upload_updated_at"
  end

  add_index "headshot_photos", ["challenge_id"], name: "index_headshot_photos_on_challenge_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "posts", ["challenge_id"], name: "index_posts_on_challenge_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "name"
    t.string   "link"
    t.string   "picture"
    t.string   "email"
    t.string   "phone"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "challenges", "users"
  add_foreign_key "headshot_photos", "challenges"
  add_foreign_key "posts", "challenges"
  add_foreign_key "posts", "users"
end
