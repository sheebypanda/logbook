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

ActiveRecord::Schema.define(version: 2019_06_20_091243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "si_id"
    t.bigint "priority_id"
    t.bigint "category_id"
    t.bigint "subject_id"
    t.datetime "start_date"
    t.text "description"
    t.boolean "disable"
    t.boolean "recurrent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_date"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["priority_id"], name: "index_events_on_priority_id"
    t.index ["si_id"], name: "index_events_on_si_id"
    t.index ["subject_id"], name: "index_events_on_subject_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "permanences", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.boolean "morning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_permanences_on_user_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sis", force: :cascade do |t|
    t.string "name"
    t.string "trigram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "firstname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.date "date"
    t.text "commentaire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_verifications_on_event_id"
    t.index ["user_id"], name: "index_verifications_on_user_id"
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "priorities"
  add_foreign_key "events", "sis"
  add_foreign_key "events", "subjects"
  add_foreign_key "events", "users"
  add_foreign_key "permanences", "users"
  add_foreign_key "verifications", "events"
  add_foreign_key "verifications", "users"
end
