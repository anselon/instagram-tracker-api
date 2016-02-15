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

ActiveRecord::Schema.define(version: 20160214043148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photo_collections", force: :cascade do |t|
    t.string   "tag"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "username"
    t.string   "src_link"
    t.string   "native_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "photos", ["native_link"], name: "index_photos_on_native_link", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "photo_collection_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "taggings", ["photo_collection_id"], name: "index_taggings_on_photo_collection_id", using: :btree
  add_index "taggings", ["photo_id"], name: "index_taggings_on_photo_id", using: :btree

  add_foreign_key "taggings", "photo_collections"
  add_foreign_key "taggings", "photos"
end
