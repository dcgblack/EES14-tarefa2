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

ActiveRecord::Schema.define(version: 20160701035748) do

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.string   "name"
    t.string   "curriculum_lattes"
    t.string   "institution"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "authors", ["publication_id"], name: "index_authors_on_publication_id"
  add_index "authors", ["user_id"], name: "index_authors_on_user_id"

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "edition"
    t.string   "local"
    t.string   "publishing_company"
    t.date     "year_of_publication"
    t.string   "description"
    t.string   "other"
    t.string   "category"
    t.string   "volume"
    t.string   "publication_number"
    t.string   "initial_final_page"
    t.string   "section"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "publications", ["user_id"], name: "index_publications_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
