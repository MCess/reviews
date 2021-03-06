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

ActiveRecord::Schema.define(version: 20170504223115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cron"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "pairing_sessions", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text     "admin_message",                    null: false
    t.text     "content",                          null: false
    t.string   "sender_id",                        null: false
    t.string   "recipient_id",                     null: false
    t.integer  "rating",                           null: false
    t.string   "willing_to_work", default: "sure", null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["sender_id", "recipient_id"], name: "index_posts_on_sender_id_and_recipient_id", using: :btree
  end

  create_table "user_pairing_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pairing_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "email",            default: "ppearing@gmail.com"
    t.string  "provider",         default: "nickname",           null: false
    t.string  "uid",                                             null: false
    t.string  "nickname"
    t.string  "repos_url"
    t.boolean "admin"
    t.boolean "profile_approved"
  end

end
