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

ActiveRecord::Schema.define(version: 20180310195606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 2000
    t.string "cipher", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "library_id"
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "surname", limit: 100
    t.string "position", limit: 256
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_employees_on_library_id"
  end

  create_table "grants", force: :cascade do |t|
    t.datetime "date"
    t.bigint "book_id"
    t.bigint "subscriber_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_grants_on_book_id"
    t.index ["subscriber_id"], name: "index_grants_on_subscriber_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "number", limit: 100
    t.string "name", limit: 1000
    t.string "address", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", limit: 2000
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "surname", limit: 100
    t.string "address", limit: 100
    t.bigint "phone"
    t.bigint "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_subscribers_on_library_id"
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "employees", "libraries"
  add_foreign_key "grants", "books"
  add_foreign_key "grants", "subscribers"
  add_foreign_key "subscribers", "libraries"
end
