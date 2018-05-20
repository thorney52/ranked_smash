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

ActiveRecord::Schema.define(version: 20180520189999) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "tier", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "player_one_id"
    t.bigint "player_two_id"
    t.bigint "player_one_character_id"
    t.bigint "player_two_character_id"
    t.bigint "winner_character_id"
    t.bigint "winner_id"
    t.bigint "stage_id"
    t.boolean "player_one_win", default: true, null: false
    t.integer "player_one_elo_change"
    t.integer "player_two_elo_change"
    t.string "confirmation_uuid", default: "0", null: false
    t.index ["player_one_character_id"], name: "index_matches_on_player_one_character_id"
    t.index ["player_one_id"], name: "index_matches_on_player_one_id"
    t.index ["player_two_character_id"], name: "index_matches_on_player_two_character_id"
    t.index ["player_two_id"], name: "index_matches_on_player_two_id"
    t.index ["stage_id"], name: "index_matches_on_stage_id"
    t.index ["winner_character_id"], name: "index_matches_on_winner_character_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "elo", default: 2000, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_sent_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "characters", column: "player_one_character_id"
  add_foreign_key "matches", "characters", column: "player_two_character_id"
  add_foreign_key "matches", "characters", column: "winner_character_id"
  add_foreign_key "matches", "stages"
  add_foreign_key "matches", "users", column: "player_one_id"
  add_foreign_key "matches", "users", column: "player_two_id"
  add_foreign_key "matches", "users", column: "winner_id"
end
