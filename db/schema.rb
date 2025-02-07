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

ActiveRecord::Schema[7.1].define(version: 2025_02_07_134033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions", force: :cascade do |t|
    t.string "title"
    t.integer "discussion_time", default: 60
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "roles"
    t.integer "votes_count"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "game_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.boolean "alive", default: true
    t.index ["game_session_id"], name: "index_players_on_game_session_id"
  end

  create_table "players_vote_candidates", id: false, force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "vote_candidate_id", null: false
    t.index ["player_id", "vote_candidate_id"], name: "idx_on_player_id_vote_candidate_id_ce545f05d3"
  end

  create_table "vote_candidates", force: :cascade do |t|
    t.bigint "vote_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_vote_candidates_on_candidate_id"
    t.index ["vote_id"], name: "index_vote_candidates_on_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "game_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_votes_on_game_session_id"
  end

  add_foreign_key "players", "game_sessions"
  add_foreign_key "vote_candidates", "players", column: "candidate_id"
  add_foreign_key "vote_candidates", "votes"
  add_foreign_key "votes", "game_sessions"
end
