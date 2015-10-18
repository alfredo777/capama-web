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

ActiveRecord::Schema.define(version: 20151014044027) do

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "type"
    t.boolean  "active"
    t.string   "head_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "blog_posts", ["type"], name: "index_blog_posts_on_type"

  create_table "conversations", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.boolean  "open_conversation"
    t.boolean  "close_conversation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_help_id"
  end

  create_table "customers", force: true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "talker_id"
    t.text     "message"
    t.string   "talker_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.integer  "role_id"
    t.string   "permission"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "modul"
  end

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "version_img"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.boolean  "active_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_helps", force: true do |t|
    t.string   "email"
    t.string   "cause"
    t.text     "explanation"
    t.string   "area"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",       default: "12312414"
    t.boolean  "open",        default: false
    t.boolean  "solve",       default: false
    t.boolean  "open_chat",   default: false
  end

  create_table "users", force: true do |t|
    t.string   "rhash"
    t.string   "card"
    t.string   "password"
    t.integer  "role_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar"
    t.string   "area"
    t.text     "address"
    t.string   "responsible_for_accidents"
    t.string   "social_security"
    t.string   "position"
    t.string   "immediate_boss"
    t.string   "immediate_boss_email"
  end

  add_index "users", ["card"], name: "index_users_on_card"

end
