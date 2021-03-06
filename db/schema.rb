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

ActiveRecord::Schema.define(version: 2020_07_15_223421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_enrollments_on_session_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "time"
    t.bigint "category_id", null: false
    t.bigint "topic_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sessions_on_category_id"
    t.index ["topic_id"], name: "index_sessions_on_topic_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "vid_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.boolean "isAdmin"
    t.integer "age"
    t.string "img_url"
    t.string "belt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enrollments", "sessions"
  add_foreign_key "enrollments", "users"
  add_foreign_key "sessions", "categories"
  add_foreign_key "sessions", "topics"
  add_foreign_key "sessions", "users"
end
