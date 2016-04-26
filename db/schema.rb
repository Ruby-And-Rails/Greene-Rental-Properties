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

ActiveRecord::Schema.define(version: 20160421061451) do

  create_table "admin_login", primary_key: "admin_id", force: :cascade do |t|
    t.string "admin_name",     limit: 55,  null: false
    t.string "admin_username", limit: 55,  null: false
    t.string "admin_password", limit: 55,  null: false
    t.string "admin_email",    limit: 55,  null: false
    t.string "contact_email",  limit: 55,  null: false
    t.string "phoneno",        limit: 200, null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string  "banner_name", limit: 200, null: false
    t.string  "largeimage",  limit: 200, null: false
    t.integer "listorder",   limit: 4,   null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "image_name", limit: 200, null: false
    t.string "thumbimage", limit: 200, null: false
    t.string "largeimage", limit: 200, null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "name",       limit: 200,   null: false
    t.string   "email",      limit: 200,   null: false
    t.string   "phone",      limit: 20,    null: false
    t.text     "message",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "page_name",        limit: 200,        null: false
    t.string "seo",              limit: 200,        null: false
    t.string "title",            limit: 250,        null: false
    t.text   "description",      limit: 4294967295, null: false
    t.string "meta_title",       limit: 300,        null: false
    t.string "meta_keyword",     limit: 300,        null: false
    t.text   "meta_description", limit: 65535,      null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "type_id",              limit: 4,                      null: false
    t.string  "unique_id",            limit: 200,                    null: false
    t.integer "property_type",        limit: 1,                      null: false
    t.string  "property_name",        limit: 250,                    null: false
    t.string  "property_location",    limit: 250,                    null: false
    t.string  "property_city",        limit: 250,                    null: false
    t.string  "property_state",       limit: 250,                    null: false
    t.integer "property_zip",         limit: 4,                      null: false
    t.text    "shortdescription",     limit: 65535,                  null: false
    t.text    "property_description", limit: 4294967295,             null: false
    t.text    "property_amenities",   limit: 4294967295,             null: false
    t.string  "lattitude",            limit: 200,                    null: false
    t.string  "longitude",            limit: 200,                    null: false
    t.integer "status",               limit: 1,          default: 1, null: false
    t.integer "listorder",            limit: 1,                      null: false
  end

  create_table "property_images", force: :cascade do |t|
    t.integer "property_id",    limit: 4,   null: false
    t.integer "is_primary",     limit: 1,   null: false
    t.string  "property_image", limit: 250, null: false
  end

  create_table "property_inquiries", force: :cascade do |t|
    t.string "property_id", limit: 200,        null: false
    t.string "name",        limit: 200,        null: false
    t.string "email",       limit: 200,        null: false
    t.string "phone",       limit: 100,        null: false
    t.text   "message",     limit: 4294967295, null: false
  end

  create_table "rental_types", primary_key: "type_id", force: :cascade do |t|
    t.string  "unique_id", limit: 200, null: false
    t.string  "type_name", limit: 250, null: false
    t.integer "status",    limit: 1,   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uniq_id",       limit: 50
    t.string   "name",          limit: 255
    t.string   "username",      limit: 255
    t.string   "email",         limit: 255
    t.string   "password",      limit: 255
    t.string   "password_salt", limit: 100
    t.datetime "dob"
    t.string   "phone",         limit: 15
    t.string   "photo",         limit: 255
    t.string   "address",       limit: 255
    t.text     "about_me",      limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
