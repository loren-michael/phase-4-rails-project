# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_05_193631) do

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "poster_url"
    t.string "mpaa"
    t.integer "year"
    t.integer "runtime"
    t.string "synopsis"
    t.boolean "availability"
    t.integer "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_movies_on_store_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "movie_id", null: false
    t.integer "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_rentals_on_movie_id"
    t.index ["store_id"], name: "index_rentals_on_store_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "movies", "stores"
  add_foreign_key "rentals", "movies"
  add_foreign_key "rentals", "stores"
  add_foreign_key "rentals", "users"
end
