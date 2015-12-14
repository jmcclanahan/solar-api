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

ActiveRecord::Schema.define(version: 20151207193422) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "fein"
    t.date     "date_of_incorp"
    t.integer  "domicile_type_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "companies", ["country_id"], name: "index_companies_on_country_id"
  add_index "companies", ["domicile_type_id"], name: "index_companies_on_domicile_type_id"
  add_index "companies", ["state_id"], name: "index_companies_on_state_id"

  create_table "company_authorities", force: :cascade do |t|
    t.date     "effective_date"
    t.date     "expiration_date"
    t.date     "issue_date"
    t.integer  "company_id"
    t.integer  "company_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "company_authorities", ["company_id"], name: "index_company_authorities_on_company_id"
  add_index "company_authorities", ["company_type_id"], name: "index_company_authorities_on_company_type_id"

  create_table "company_types", force: :cascade do |t|
    t.string   "company_type_code"
    t.string   "company_type_desc"
    t.boolean  "isactive"
    t.integer  "state_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "company_types", ["state_id"], name: "index_company_types_on_state_id"

  create_table "countries", force: :cascade do |t|
    t.string   "country_code"
    t.string   "country_desc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "domicile_types", force: :cascade do |t|
    t.string   "domicile_type_code"
    t.string   "domicile_type_desc"
    t.integer  "state_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "domicile_types", ["state_id"], name: "index_domicile_types_on_state_id"

  create_table "line_types", force: :cascade do |t|
    t.string   "line_type_desc"
    t.string   "line_type_code"
    t.integer  "state_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "line_types", ["state_id"], name: "index_line_types_on_state_id"

  create_table "lobs", force: :cascade do |t|
    t.date     "effective_date"
    t.date     "termination_date"
    t.integer  "line_type_id"
    t.integer  "company_authority_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lobs", ["company_authority_id"], name: "index_lobs_on_company_authority_id"
  add_index "lobs", ["line_type_id"], name: "index_lobs_on_line_type_id"

  create_table "states", force: :cascade do |t|
    t.string   "state_code"
    t.string   "state_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
