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

ActiveRecord::Schema.define(version: 20151214033111) do

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

  create_table "celphone_images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "entities", force: true do |t|
    t.string   "name"
    t.string   "format_folio"
    t.integer  "in_charge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "format_forms", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "public",      default: false
    t.string   "tclass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "format_forms_to_roles", force: true do |t|
    t.integer  "format_form_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspects", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "inconforme"
    t.string   "acount"
    t.string   "meter"
    t.string   "t_ser"
    t.string   "additional_data"
    t.string   "date"
    t.string   "visit_date"
    t.string   "general_inspect"
    t.string   "shooting_conditions"
    t.string   "home_room"
    t.string   "number_of_people"
    t.string   "ordeno_prueba_de_inspeccion"
    t.string   "property_activity"
    t.string   "anomalies"
    t.string   "meter_conditions"
    t.string   "additional_report"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_inspect_id"
  end

  create_table "messages", force: true do |t|
    t.integer  "talker_id"
    t.text     "message"
    t.string   "talker_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  add_index "messages", ["talker_id", "talker_type"], name: "index_messages_on_talker_id_and_talker_type"

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

  create_table "public_images", force: true do |t|
    t.string   "img"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "public_images", ["imageable_id", "imageable_type"], name: "index_public_images_on_imageable_id_and_imageable_type"

  create_table "question_options", force: true do |t|
    t.string   "qotag"
    t.string   "qovalue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  create_table "question_responses", force: true do |t|
    t.string   "question_id"
    t.string   "question_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "form_sender"
  end

  create_table "questions", force: true do |t|
    t.string   "qtag"
    t.string   "qtype"
    t.string   "qclass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "format_form_id"
  end

  create_table "reading_assignments", force: true do |t|
    t.integer  "user_id"
    t.date     "future_scheduled"
    t.string   "route_number"
    t.datetime "synchronization_date"
  end

  add_index "reading_assignments", ["synchronization_date"], name: "index_reading_assignments_on_synchronization_date"
  add_index "reading_assignments", ["user_id"], name: "index_reading_assignments_on_user_id"

  create_table "reading_takes_waters", force: true do |t|
    t.string   "business_name"
    t.string   "address"
    t.string   "colony"
    t.string   "water_meter"
    t.string   "sx"
    t.string   "ux"
    t.string   "stage"
    t.string   "account_number"
    t.integer  "reading_assignment_id"
    t.boolean  "successfully_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diameter"
    t.text     "lecture"
    t.text     "abnormalities"
    t.text     "observations"
    t.text     "reference"
    t.string   "data_access"
    t.string   "last_read"
    t.string   "sector"
    t.string   "id_route"
    t.string   "assigned_device"
    t.string   "m3"
  end

  add_index "reading_takes_waters", ["business_name"], name: "index_reading_takes_waters_on_business_name"
  add_index "reading_takes_waters", ["water_meter"], name: "index_reading_takes_waters_on_water_meter"

  create_table "roles", force: true do |t|
    t.string   "title"
    t.boolean  "active_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_contracts", force: true do |t|
    t.string   "drinking_water"
    t.string   "sewage_system"
    t.string   "acount"
    t.string   "meter"
    t.string   "diameter"
    t.string   "applicant_name"
    t.string   "address"
    t.string   "colony"
    t.string   "phone"
    t.string   "bussiness_name"
    t.string   "rfc"
    t.string   "commercial_bussines"
    t.string   "legal_representative"
    t.string   "type_service"
    t.string   "legal_title"
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
    t.string   "latitude"
    t.string   "longitude"
    t.string   "ticket_type", default: "external"
  end

  create_table "user_inspects", force: true do |t|
    t.integer  "user_id"
    t.date     "date_inspect"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "views", force: true do |t|
    t.integer  "viewver_id"
    t.string   "viewver_type"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agent"
  end

  create_table "zones", force: true do |t|
    t.string   "title"
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
