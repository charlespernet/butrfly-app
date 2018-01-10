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

ActiveRecord::Schema.define(version: 20180110050800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "aupairs", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "birth_date"
    t.text    "description"
    t.boolean "driving_license"
    t.boolean "musician"
    t.integer "gender_cd",                default: 0
    t.boolean "experience_aupair"
    t.boolean "educational_experience"
    t.boolean "accepted_domestic_animal"
    t.boolean "sports"
    t.date    "dispo_from"
    t.integer "stay_duration_cd"
    t.string  "photo"
    t.string  "phone"
    t.string  "address"
    t.string  "city"
    t.string  "country"
    t.integer "environment"
    t.string  "favorite_region"
    t.boolean "housework"
  end

  create_table "basic_languages", force: :cascade do |t|
    t.integer  "aupair_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["aupair_id"], name: "index_basic_languages_on_aupair_id", using: :btree
    t.index ["language_id"], name: "index_basic_languages_on_language_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_conversations_on_sender_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string  "name"
    t.boolean "domestic_animal"
    t.integer "children_age_from"
    t.integer "children_age_to"
    t.integer "children_number"
    t.text    "description"
    t.integer "prefered_gender_cd",       default: 0
    t.date    "starting_date"
    t.integer "prefered_duration_cd",     default: 0
    t.boolean "experience_with_aupair"
    t.integer "family_type_cd",           default: 0
    t.boolean "housework"
    t.boolean "driving_license_required"
    t.string  "photo"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "phone"
    t.string  "address"
    t.string  "city"
    t.string  "country"
    t.integer "aupair_children_number"
    t.integer "house_type"
    t.integer "environment"
    t.boolean "aupair_experience"
    t.string  "aupair_nationality"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "prefered_countries", force: :cascade do |t|
    t.integer  "aupair_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aupair_id"], name: "index_prefered_countries_on_aupair_id", using: :btree
    t.index ["country_id"], name: "index_prefered_countries_on_country_id", using: :btree
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.integer  "aupair_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["aupair_id"], name: "index_spoken_languages_on_aupair_id", using: :btree
    t.index ["language_id"], name: "index_spoken_languages_on_language_id", using: :btree
  end

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
    t.string   "actable_type"
    t.integer  "actable_id"
    t.string   "country_code"
    t.string   "stripe_id"
    t.datetime "active_until"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "basic_languages", "aupairs"
  add_foreign_key "basic_languages", "languages"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "prefered_countries", "aupairs"
  add_foreign_key "prefered_countries", "countries"
  add_foreign_key "spoken_languages", "aupairs"
  add_foreign_key "spoken_languages", "languages"
end
