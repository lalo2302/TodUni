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

ActiveRecord::Schema.define(version: 20160322045039) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "state_id",   limit: 4
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "project_id", limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "evidences", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "content",     limit: 255
    t.integer  "status",      limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "stage_id",    limit: 4
    t.integer  "user_id",     limit: 4
  end

  add_index "evidences", ["stage_id"], name: "index_evidences_on_stage_id", using: :btree
  add_index "evidences", ["user_id"], name: "index_evidences_on_user_id", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "tag",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "coordinates", limit: 255
    t.date     "due_date"
    t.integer  "status",      limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "city_id",     limit: 4
    t.string   "picture",     limit: 255
  end

  add_index "projects", ["city_id"], name: "index_projects_on_city_id", using: :btree

  create_table "projects_hashtags", id: false, force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.integer "hashtag_id", limit: 4
  end

  add_index "projects_hashtags", ["hashtag_id"], name: "index_projects_hashtags_on_hashtag_id", using: :btree
  add_index "projects_hashtags", ["project_id"], name: "index_projects_hashtags_on_project_id", using: :btree

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.integer "user_id",    limit: 4
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "stages", force: :cascade do |t|
    t.integer  "stage_num",   limit: 4
    t.text     "description", limit: 65535
    t.date     "due_date"
    t.integer  "status",      limit: 4,     default: 0
    t.integer  "hours",       limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "project_id",  limit: 4
  end

  add_index "stages", ["project_id"], name: "index_stages_on_project_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.datetime "birth_date"
    t.string   "name",                   limit: 255
    t.integer  "status",                 limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
