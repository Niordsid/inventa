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

ActiveRecord::Schema.define(version: 20170624192042) do

  create_table "agents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articulos", force: :cascade do |t|
    t.string   "codigo",       limit: 255
    t.string   "descripcion",  limit: 255
    t.integer  "existencia",   limit: 4
    t.boolean  "status",                   default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "categoria_id", limit: 4
  end

  add_index "articulos", ["categoria_id"], name: "index_articulos_on_categoria_id", using: :btree

  create_table "categorias", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "titular",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "entities", force: :cascade do |t|
    t.integer "agent_id",       limit: 4
    t.string  "name",           limit: 255
    t.string  "contact_number", limit: 255
    t.string  "address",        limit: 255
    t.string  "kind",           limit: 255
  end

  create_table "enviarpedidos", force: :cascade do |t|
    t.integer  "solicitado",  limit: 4
    t.integer  "surtido",     limit: 4
    t.integer  "pedido_id",   limit: 4
    t.integer  "articulo_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "categoria_id",    limit: 4
    t.string   "materialname",    limit: 255
    t.integer  "cantidad",        limit: 4
    t.decimal  "purchase_price",              precision: 10
    t.decimal  "sale_price",                  precision: 10
    t.decimal  "transport_price",             precision: 10
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "entity_id",         limit: 4
    t.string   "offer_name",        limit: 255
    t.integer  "amount",            limit: 4
    t.time     "registration_date"
    t.integer  "validity",          limit: 4
    t.time     "expiration_date"
    t.decimal  "offer_price",                   precision: 50, scale: 2
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "codigo",          limit: 4
    t.integer  "departamento_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pedidos", ["departamento_id"], name: "index_pedidos_on_departamento_id", using: :btree
  add_index "pedidos", ["user_id"], name: "index_pedidos_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "nombre",                 limit: 255
    t.string   "apellidos",              limit: 255
    t.boolean  "admin",                              default: false
    t.string   "usuario",                limit: 255
    t.string   "rol",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
