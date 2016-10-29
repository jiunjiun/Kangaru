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

ActiveRecord::Schema.define(version: 20161029103403) do

  create_table "adapter_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "secret"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "adapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "adaptable_type"
    t.integer  "adaptable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["adaptable_type", "adaptable_id"], name: "index_adapters_on_adaptable_type_and_adaptable_id", using: :btree
    t.index ["user_id"], name: "index_adapters_on_user_id", using: :btree
  end

  create_table "message_texts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "visitor_id"
    t.integer  "user_id"
    t.integer  "kind"
    t.string   "template_type"
    t.integer  "template_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["template_type", "template_id"], name: "index_messages_on_template_type_and_template_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
    t.index ["visitor_id"], name: "index_messages_on_visitor_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "identifier"
    t.string   "name"
    t.string   "avatar"
    t.integer  "user_id"
    t.integer  "adapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adapter_id"], name: "index_visitors_on_adapter_id", using: :btree
    t.index ["user_id"], name: "index_visitors_on_user_id", using: :btree
  end

  add_foreign_key "adapters", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "visitors"
  add_foreign_key "visitors", "adapters"
  add_foreign_key "visitors", "users"
end
