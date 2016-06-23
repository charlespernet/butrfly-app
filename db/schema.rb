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

ActiveRecord::Schema.define(version: 20160623090447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aupairs", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "birth_date"
    t.text    "description"
    t.boolean "driving_license"
    t.boolean "musician"
    t.integer "gender",                   default: 1
    t.boolean "experience_aupair"
    t.boolean "educational_experience"
    t.boolean "accepted_domestic_animal"
    t.boolean "sports"
    t.integer "mother_tongue"
    t.integer "languages_spoken",         default: [], array: true
    t.string  "prefered_countries",       default: [], array: true
  end

  create_table "families", force: :cascade do |t|
    t.string  "name"
    t.boolean "domestic_animal"
    t.integer "children_age_from"
    t.integer "children_age_to"
    t.integer "children_number"
    t.text    "description"
    t.integer "prefered_gender_aupair",   default: 0
    t.date    "starting_date"
    t.integer "length_of_stay",           default: 0
    t.boolean "experience_with_aupair"
    t.integer "family_type",              default: 0
    t.boolean "housework"
    t.boolean "driving_license_required"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.integer  "aupair_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "spoken_languages", ["aupair_id"], name: "index_spoken_languages_on_aupair_id", using: :btree
  add_index "spoken_languages", ["language_id"], name: "index_spoken_languages_on_language_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "country_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "spoken_languages", "aupairs"
  add_foreign_key "spoken_languages", "languages"
end
