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

ActiveRecord::Schema.define(version: 20160622233948) do

  create_table "application_comments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id", limit: 4
    t.integer  "owner",          limit: 4
    t.text     "comment",        limit: 65535
  end

  create_table "application_flows", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_to_read", limit: 255
    t.string   "condition",      limit: 255
    t.string   "action",         limit: 255
  end

  create_table "application_modules", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_type", limit: 4
    t.string   "rails_form_type",  limit: 255
  end

  create_table "application_type_directors", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_type", limit: 4
    t.integer  "advisor",          limit: 4
  end

  create_table "application_types", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name",   limit: 255
    t.string   "short_name",  limit: 255
    t.boolean  "on_our_site",               default: true
    t.text     "url",         limit: 65535
    t.text     "description", limit: 65535
    t.boolean  "visible",                   default: false
  end

  add_index "application_types", ["short_name"], name: "index_application_types_on_short_name", using: :btree

  create_table "applications", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year",             limit: 4
    t.string   "quarter",          limit: 255
    t.integer  "application_type", limit: 4
    t.integer  "owner_id",         limit: 4
    t.integer  "advisor_id",       limit: 4
    t.string   "organization",     limit: 255
    t.boolean  "is_signatory"
    t.integer  "status",           limit: 4
    t.decimal  "amount_requested",             precision: 10
    t.decimal  "amount_rewarded",              precision: 10
    t.float    "account_number",   limit: 24
  end

  add_index "applications", ["advisor_id"], name: "index_applications_on_advisor_id", using: :btree
  add_index "applications", ["organization"], name: "index_applications_on_organization", using: :btree
  add_index "applications", ["owner_id"], name: "index_applications_on_owner_id", using: :btree
  add_index "applications", ["status"], name: "index_applications_on_status", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text",                  limit: 255
    t.boolean  "visible",                           default: true
    t.integer  "weight",                limit: 4
    t.boolean  "assignable_by_user",                default: false
    t.boolean  "assignable_by_advisor",             default: true
  end

  add_index "statuses", ["text"], name: "index_statuses_on_text", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner",       limit: 4
    t.string   "file_name",   limit: 255
    t.string   "box_file_id", limit: 255, default: ""
    t.string   "box_url",     limit: 255, default: ""
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: ""
    t.string   "box_user_id",            limit: 255
    t.boolean  "disabled",                           default: false
    t.boolean  "advisor",                            default: false
    t.boolean  "fund_director",                      default: false
    t.boolean  "rights_to_reports",                  default: false
    t.boolean  "rights_to_edit",                     default: false
    t.boolean  "rights_to_manage_users",             default: false
    t.boolean  "rights_to_admin",                    default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
