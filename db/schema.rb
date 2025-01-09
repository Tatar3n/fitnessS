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

ActiveRecord::Schema[8.0].define(version: 2024_12_24_193954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "name", null: false
    t.float "min_athlete_weight"
    t.float "max_athlete_weight"
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions_users", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "user_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competitions_users_on_competition_id"
    t.index ["user_id"], name: "index_competitions_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "place", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.bigint "referee_id", null: false
    t.bigint "competition_id", null: false
    t.float "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_results_on_athlete_id"
    t.index ["competition_id"], name: "index_results_on_competition_id"
    t.index ["referee_id"], name: "index_results_on_referee_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "role_name", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competitions_users", "competitions"
  add_foreign_key "competitions_users", "users"
  add_foreign_key "results", "competitions"
  add_foreign_key "results", "users", column: "athlete_id"
  add_foreign_key "results", "users", column: "referee_id"
  add_foreign_key "roles", "users"
end
