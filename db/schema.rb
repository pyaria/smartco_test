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

ActiveRecord::Schema.define(version: 20160205222843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grantings", force: :cascade do |t|
    t.integer  "grant_id"
    t.integer  "scientist_id"
    t.string   "role"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "grantings", ["grant_id"], name: "index_grantings_on_grant_id", using: :btree
  add_index "grantings", ["scientist_id"], name: "index_grantings_on_scientist_id", using: :btree

  create_table "grants", force: :cascade do |t|
    t.string   "project_title"
    t.decimal  "max_CFI"
    t.date     "final_decision"
    t.string   "institution"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "scientists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grantings", "grants"
  add_foreign_key "grantings", "scientists"
end
