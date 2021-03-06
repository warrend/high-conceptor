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

ActiveRecord::Schema.define(version: 20170510203215) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logline_categories", force: :cascade do |t|
    t.integer  "logline_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_logline_categories_on_category_id"
    t.index ["logline_id"], name: "index_logline_categories_on_logline_id"
  end

  create_table "loglines", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "average_rating"
    t.index ["user_id"], name: "index_loglines_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "logline_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logline_id"], name: "index_ratings_on_logline_id"
    t.index ["user_id", "logline_id"], name: "index_ratings_on_user_id_and_logline_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "uid"
    t.text     "bio"
    t.integer  "logline_count",   default: 0
  end

end
