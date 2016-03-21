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

ActiveRecord::Schema.define(version: 20160321053403) do

  create_table "ciudades", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "id_estado",  limit: 4
  end

  add_index "ciudades", ["id_estado"], name: "index_ciudades_on_id_estado", using: :btree

  create_table "comentarios", force: :cascade do |t|
    t.text     "texto",       limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "id_proyecto", limit: 4
    t.integer  "id_user",     limit: 4
  end

  add_index "comentarios", ["id_proyecto"], name: "index_comentarios_on_id_proyecto", using: :btree
  add_index "comentarios", ["id_user"], name: "index_comentarios_on_id_user", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "etapas", force: :cascade do |t|
    t.integer  "numero_etapa", limit: 4
    t.text     "descripcion",  limit: 65535
    t.date     "fecha_final"
    t.integer  "estatus",      limit: 4,     default: 0
    t.integer  "horas",        limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "id_proyecto",  limit: 4
  end

  add_index "etapas", ["id_proyecto"], name: "index_etapas_on_id_proyecto", using: :btree

  create_table "evidencias", force: :cascade do |t|
    t.string   "titulo",      limit: 255
    t.text     "descripcion", limit: 65535
    t.string   "contenido",   limit: 255
    t.integer  "estatus",     limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "id_etapa",    limit: 4
    t.integer  "id_user",     limit: 4
  end

  add_index "evidencias", ["id_etapa"], name: "index_evidencias_on_id_etapa", using: :btree
  add_index "evidencias", ["id_user"], name: "index_evidencias_on_id_user", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "tag",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proyectos", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.string   "coordenadas", limit: 255
    t.date     "fecha_final"
    t.integer  "estatus",     limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "id_ciudad",   limit: 4
  end

  add_index "proyectos", ["id_ciudad"], name: "index_proyectos_on_id_ciudad", using: :btree

  create_table "proyectos_hashtags", id: false, force: :cascade do |t|
    t.integer "id_proyecto", limit: 4
    t.integer "id_hashtag",  limit: 4
  end

  add_index "proyectos_hashtags", ["id_hashtag"], name: "index_proyectos_hashtags_on_id_hashtag", using: :btree
  add_index "proyectos_hashtags", ["id_proyecto"], name: "index_proyectos_hashtags_on_id_proyecto", using: :btree

  create_table "proyectos_users", id: false, force: :cascade do |t|
    t.integer "id_proyecto", limit: 4
    t.integer "id_user",     limit: 4
  end

  add_index "proyectos_users", ["id_proyecto"], name: "index_proyectos_users_on_id_proyecto", using: :btree
  add_index "proyectos_users", ["id_user"], name: "index_proyectos_users_on_id_user", using: :btree

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
    t.datetime "fecha_nacimiento"
    t.string   "nombre",                 limit: 255
    t.integer  "estatus",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
