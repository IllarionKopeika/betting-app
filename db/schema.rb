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

ActiveRecord::Schema[8.0].define(version: 2026_08_17_132112) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "competition_teams", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competition_teams_on_competition_id"
    t.index ["team_id", "competition_id"], name: "index_competition_teams_on_team_id_and_competition_id", unique: true
    t.index ["team_id"], name: "index_competition_teams_on_team_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "prediction_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "predictions", force: :cascade do |t|
    t.integer "prediction_type"
    t.integer "predicted_position"
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.bigint "competition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_predictions_on_competition_id"
    t.index ["team_id"], name: "index_predictions_on_team_id"
    t.index ["user_id", "team_id", "competition_id"], name: "index_predictions_on_user_id_and_team_id_and_competition_id", unique: true
    t.index ["user_id"], name: "index_predictions_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "ip_address"
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "en_name"
    t.string "ru_name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "competition_teams", "competitions"
  add_foreign_key "competition_teams", "teams"
  add_foreign_key "predictions", "competitions"
  add_foreign_key "predictions", "teams"
  add_foreign_key "predictions", "users"
  add_foreign_key "sessions", "users"
end
